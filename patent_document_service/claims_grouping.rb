require 'json'
require 'pry'

class ClaimsGroup
  attr_accessor :patent_data, :claims, :ic
  def initialize
    @patent_data = get_json_data
    @claims = {}
    (patent_data['claims'] || []).map{ |claim| 
      claim['ifi_claim_num'] = claim['claim_num']
      claim['claim_num'] = claim['claim_num'].to_s.strip.gsub(/^0+/, "").to_s
    }
    @claims = patent_data['claims']
  end

  def get_json_data
    # data = File.read("US7895306B2.json")
    data = File.read("US7963687B2.json")
    JSON.parse(data)
  end

  def get_ult_parent(val)
    (ic[val.to_s].length == 0 || (ic[val.to_s].sort.first.to_s == val.to_s)) ? val.to_s : get_ult_parent(ic[val.to_s].sort.first.to_s)
  end

  def word_count(val)
    (val || "").gsub(/<\/?[^>]+>/, '').strip.split(" ").count
  end

  def get_ifi_ic_stripped
    @ic = (patent_data['ifi_integrated_content'] || {})
    stripped = {}
    ic.keys.each do |k|
      stripped[k.to_s.strip.gsub(/^0+/, "").to_s] = ic[k].map{|cn| cn.to_s.strip.gsub(/^0+/, "").to_s }
    end
    ic = stripped
  end

  def get_claim_groups
    get_ifi_ic_stripped
    claims.each do |claim|
      parent = nil
      if ic[claim['claim_num'].to_s].length > 0 && ic[claim['claim_num'].to_s].sort.first.to_s != claim['claim_num'].to_s
        parent = get_ult_parent(ic[claim['claim_num'].to_s].sort.first.to_s)
      end
      word_count = (claim['claim_text'] || "").gsub(/<\/?[^>]+>/, '').strip.split(" ").count
      if word_count > 0
        claim['depends_on'] = (ic[claim['claim_num'].to_s] || []).map{|val| val ? val.to_s : nil}
        claim['word_count'] = word_count
        if parent
          claims[parent.to_i-1]['dependent_claims'] ||= []
          claims[parent.to_i-1]['dependent_claims'] << claim
        end
      end
    end
    claims.select{ |claim| (ic[claim['claim_num'].to_s].length == 0) || ic[claim['claim_num'].to_s].first.to_s == claim['claim_num'].to_s }
  end
end

obj = ClaimsGroup.new
new_claims = obj.get_claim_groups
puts "Independant claim count #{new_claims.count}"
File.open('claims_US7963687B2.json', 'wb') do |file|
  file.write(JSON.pretty_generate(new_claims))
end