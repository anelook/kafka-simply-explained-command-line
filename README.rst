Hands-on material for session "Apache Kafka simply explained" (command line version)
====================================================================================

Running locally
---------------

1. We'll need an Apache Kafka cluster. Apache Kafka is an open source platform, so you can either `set it up from its source code <https://kafka.apache.org/quickstart#quickstart_download>`_ or use a fully managed option, for example sign up for  `30 day free trial with Aiven <https://aiven.io/kafka>`_. I'll be using the latter option and relying on Aiven interfaces to do some routine tasks.

2. We'll be using `kcat tool <https://github.com/edenhill/kcat>`_. It will allow us work with Apache Kafka topics through the command line interface. To install and setup the tool follow `this instructions <https://developer.aiven.io/docs/products/kafka/howto/kcat>`_.

3. To help you setup kcat, I prepared kcat.config file. You can clone this repository, download and put certificates inside this folder (.gitignore will keep them from being committed). Copy kcat.config.example and rename it to kcat.config. Set the address of your Kafka server as a value ``bootstrap.servers`` inside kcat.config.

4. In your cluster `create a topic <https://developer.aiven.io/docs/products/kafka/howto/create-topic.html>`_ 'customer-activity' with 3 partitions.

Now you're ready for demo exercises. In these demos we'll focus on a single topic that contains events based on customer activity in an online shop.

Step # 1: send messages (producer)
----------------------------------

To send messages to Apache Kafka cluster we'll use kcat in a producer mode. You can send a single message directly from your terminal by using this command:

.. code::

    echo '''
    {
        name : test1
    }
    ''' | kcat -F kcat.config -P -t customer-activity  -k test-message-key

Alternatively, I prepared a bash script located in `producer.sh`. It will send 50 randomised messages into the topic. Don't forget to run ``chmod +x ./send-messages.sh`` in order to give access permissions.



Step # 2: read messages (consumer)
----------------------------------

In this step we'll read the messages we already sent to the cluster.
In the terminal run:

.. code::

    kcat -F kcat.config -C -t customer-activity  -o -1

You should see any of the messages you already sent o the topic. Also, the process will wait and output any new messages. I recommend leaving this tab running while you experiment with the producer.

Resources and additional materials
----------------------------------
1. `A ready fake data generator <https://developer.aiven.io/docs/products/kafka/howto/fake-sample-data.html>`_ to source data into Apache Kafka cluster.
2. `Teach yourself Apache Kafka and Python with a Jupyter Notebook <https://aiven.io/blog/teach-yourself-apache-kafka-and-python-with-a-jupyter-notebook>`_.
3. `How to use Karapace schema registry <https://aiven.io/blog/what-is-karapace>`_ to align the structure of data coming to Kafka cluster.
4. `How to use Apache Kafka Connect as streaming bridge between different database technologies <https://aiven.io/blog/db-technology-migration-with-apache-kafka-and-kafka-connect>`_.

License
-------

This work is licensed under the Apache License, Version 2.0. Full license text is available in the LICENSE file and at http://www.apache.org/licenses/LICENSE-2.0.txt