# Elastic search

- Elasticsearch is a highly scalable open-source **full-text search** and **analytics engine**.
- It allows to
    > - Store
    > - Search
    > - Analyse the big volume of data
- It is generally used as the underlying engine for complex search.
- Example use cases : -
    >  - Online web store (customer search for products)
    >  - Price alerting platform (if the customer know the particular item pricing drop in last month)
    >  - To build custom dashboards for business intelligence/analytics.

### Concepts

- Near Realtime (NRT)
- **Clustor**
    > - Collection of one or more nodes(servers).
    > - Provides federated indexing and search capabilities.
    > - It is identified by a unique name (default is ‘elastic search’)
- **Node** 
    > - Single server.
    > - Node is identified by a name which by default is a random Universally Unique Identifier(**UUID**).
    > - In a single cluster, you can have as many nodes as you want. Furthermore, if there are no other Elasticsearch nodes currently running on your network.
- **Index**
    > - An index is a collection of documents that have somewhat similar characteristics.
- **Type**
    > - Logical category/partition of the index to allow you to store diff types of documents in the same index.


- **Document**
    > - Basic unit of information that can be indexed.(single customer, another doc for single product, yet another for a single order).
    > - Document is expressed in JSON.
- **Shards and Replicas**
  - Subdivide the index into multiple pieces called **shards**.
  - Sharding is important for two primary reasons : -
    > - It allows you to horizontally split/scale your content volume.
    > - It allows you to distribute and parallelize operations across shards (potentially on multiple nodes) thus increasing performance/throughput.

  - Elasticsearch allows you to make one or more copies of your index’s shards into what are called **replica shards**, or replicas for short.
   - Replication is important for two primary reasons:
     > - It provides high availability in case a shard/node fails. For this reason, it is important to note that a replica shard is never allocated on the same node as the original/primary shard that it was copied from.
     > - It allows you to scale out your search volume/throughput since searches can be executed on all replicas in parallel.
  - Each index can be split into **multiple shards**. An index can also be replicated zero (meaning no replicas) or more times.
  - Each index in Elasticsearch is allocated 5 primary shards and 1 replica which means that if you have at least two nodes in your cluster, your index will have 5 primary shards and another 5 replica shards (1 complete replica) for a total of 10 shards per index.




### Installation

- Java 8 / 8+ needed.

- In Ubuntu  / debian : -

    > - curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.4.2.tar.gz
    > - tar -xvf elasticsearch-6.4.2.tar.gz
    > - cd elasticsearch-6.4.2/bin
    > - ./elasticsearch



