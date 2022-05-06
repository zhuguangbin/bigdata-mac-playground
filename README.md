# 在Mac上构建大数据游乐场(BigData Playground)

   如果你是做大数据相关的工作，你一定每天在捣鼓各个大数据组件，无论是大数据底层架构，还是数据开发。为什么需要一个BigData Playground呢？以我自己日常工作为例，有以下几个场景：

   1. 对某个组件感兴趣，或者有需求应用但需要前期充分调研，在生产部署之前，先在自己的Mac上试玩一下
   2. 对某个组件进行了源码bugfix或者new feature开发，在本地先验证下
   3. 遇到一个非常棘手的问题，需要远程调试来了解运行机制，而线上环境不允许remote debug吧？
   4. 学习源码，在本地随意的折腾

   那为什么是Mac呢？其实Ubuntu等Linux发行版也可以，但Windows就不建议了。搞大数据底层或者开发的，生产环境天天跟Linux打交道，最好自己的开发环境也跟Linux保持一致。Mac的Darwin内核与Linux同源，能够让你更贴近生产环境。
   另外，作为一个十来年的Mac党，Mac OS的生产效率是我们最在意的，懂的自然懂，不接受反驳。所以，如果你要继续下面的内容，你得先有台Mac，MBP也好，MBA也好，Mac Mini也好，总之我们需要Mac OS。
   配置当然越高越好，用起来卡是最烦躁的事情，不是么？尤其是大数据体系，东西很多，随便搞几个服务CPU和内存就捉襟见肘了。有公司福利比较好给员工配Mac，比如我目前正在用的最顶配MBP 16（Intel i9 8Core + 32G + 1T SSD）。
   如果公司不给配，自己掏腰包，怎么也得搞个i5 4Core + 16G + 512G SSD。作为IT码农，少抽颗烟，少喝顿酒，省点银子整个好用的家伙事，毕竟每天在用，图个舒心。

## Table of Contents

### Part I: 基础组件部署 

1. [基础环境准备](docs/part-I/1.essential.md)
2. [Hadoop](docs/part-I/2.hadoop.md)
3. [Hive](docs/part-I/3.hive.md)
4. [Spark](docs/part-I/4.spark.md)
5. [Kafka](docs/part-I/5.kafka.md)
6. [Flink](docs/part-I/6.flink.md)
7. [Presto](docs/part-I/7.presto.md)
8. [Kyuubi](docs/part-I/8.kyuubi.md)
9. [Hudi](docs/part-I/9.hudi.md)

### Part II: 综合实战

1. [A LakeHouse Prototype Demo](docs/part-II/1.lakehouse.md)

## About This Repo

大数据体系是一个快速发展的领域，各组件版本迭代非常快，且不断有好的项目涌现出来，本文档内容有可能随着时间推移而滞后。笔者将努力保持内容是最新且可用的，但是精力有限，如您发现问题，请提issue或者pull request来共同完善。