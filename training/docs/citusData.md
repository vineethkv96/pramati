# Citus Data

#### What is citus ?

- **Open-source** PostgreSQL extension.
- **Scalable** across multiple machines through sharding and replication.	
- **Distributed** engine for query parallelization 		
- Database 	designed to scale **multi-tenant** applications .

> Citus is an extension to Postgres that intelligently distributes your database

##### Two primary use cases for Citus Data : -
  - Fast growing B2B apps for customers like ProsperWorks.
  - Customer-facing analytical dashboards for customers such as  Cloudflare.

##### Horizontal scalability

Citus Data provides the horizontal scalability of a NoSQL database with the 	transactional consistency and functionality of a relational database.

##### It provides:
  - Massively parallel processing 	for SQL analytics. 	
	
  - Real-time inserts/updates on 	distributed database tables. 	
	
  - Dynamic scalability on commodity hardware with ability to easily add or remove nodes. 	
	
  - JSON and structured data in one database. 	
	
  - The expressiveness and familiarity of Postgres. 	
	
  - Multi-tenancy to more than 100,000 tenants. It supports tenant isolation to provide performance guarantees for large tenants, and has the concept of reference tables to reduce data duplication across tenants. 	
> tenents : - Group of users who share a common access with some privilages.


##Reviews

1. **Jarred Nicholls**, chief software architect at IronNet Cybersecurity.
   
    > Citus makes things possible for us that would have been nightmarish in a NoSQL world. Moving to Citus has improved the reliability and performance of our database, and the fact that it’s not a black box and all the Citus metadata is open and hackable gives us a lot of flexibility.


2. **Dan Robinson**, CTO at Heap

    > Thanks to Citus, we’re powering a product that is really kind of magical for a lot of customers. The speed and performance of our database make it possible for them to immediately perform truly advanced analytics on any user activities they want to explore.

3. **Kelly Cheng**, CTO and Co-Founder at Copper (formerly ProsperWorks)

    > By adopting Citus Cloud to scale out Postgres, we didn’t have to slow down feature development to shard at the application level. For us, Citus was the fastest and best way to protect our engineering throughput while still scaling the database.

4. **Sylvain Friquet**, Software Engineer, Algolia

    > At Algolia, our job is to provide the best search as a service, not to maintain clusters of PostgreSQL servers. We really wanted a database that scales, a database we wouldn’t have to worry about. Citus has given us that.

5. **Vidur Apparao**, CTO at Agari

    > I like Citus’ combination of features, open source flexibility, and commercial-grade scalability. Best of all, because Citus is built on the latest version of PostgreSQL, we have been able to continue using the same core SQL toolset, leverage our existing PostgreSQL expertise, and take advantage of the continuing innovation within the PostgreSQL community.

6. **Deepak Balasubramanyam**, Technical Architect at Freshworks

    > Usually for analytics applications, acceptable response times can be a matter of seconds. And this is especially true for long-term reporting that needs to query a huge amount of data. With Citus, it’s amazing. The response time on long-term queries of billions of rows is on the order of milliseconds.

7. **Shashank Kumar**, Founder at PushOwl

    > With Citus Cloud, we don’t have to worry about our infrastructure. That’s one of the main reasons I’m on Citus. We don’t have to think about DevOps anymore. We’re automatically and seamlessly scaling in the cloud, and we’re now managing more than 6,500 ecommerce stores.

8. **Jonathan Denney**, CTO and Co-Founder at ConvertFlow

    > We provisioned a new database using the Citus Cloud console, ran our migrations, copied over our data from Heroku, and we were up and running on Citus in just a few minutes. And the technical benefits were instant. We saw queries that were once taking 15-30+ seconds reduced to less than 500 ms.

### When to Use Citus
- Citus serves many use cases. 
- Two common ones are : -
    - scaling multi-tenant (B2B) databases and 
    - real-time analytics. 




