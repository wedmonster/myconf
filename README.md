README for GST
=============

[toc]

Overview
-----
GST is Graph Searching Tool in MATLAB. 
Version : 1.0.1
Date: Nov 30, 2015
Authors: Jinhong Jung (*jinhongjung@snu.ac.kr*), U Kang (*ukang@snu.ac.kr*)

Getting Started
------

### Environment

 1. OS: Linux Ubuntu 14.04.4 LTS
 2. MATLAB: R2015b
	 - MCR (MATLAB Complier Runtime): R2015b

### Installation

#### Installation of GST (Graph Searching Tool)
Dowaload GST-v.1.0.1.zip and extract it. There are following folders and files inside the extracted folder. 

```
├── data
│   ├── attr
│   ├── data_node_attr
│   ├── data_node_node
│   └── node_attr_dom
├── demo.sh
├── doc
│   └── user_guide.pdf
├── gst.cnf
├── gst.sh
├── input
│   ├── query_node_attr
│   └── query_node_node
├── output
└── README.md
```

#### Installation of MATLAB (MATLAB Runtime Complier)
Since our program is deployed using MATLAB as a standalone application, you need to install MCR (MATLAB Complier Runtime) if you want to run our program without installing MATLAB. You can download MCR[^mcr] from the following link:

> [http://www.mathworks.com/products/compiler/mcr/index.html][1]

[^mcr]: They currently support MCR on the following platforms: Windows, Linux, and Mac.

### Configuration

#### Setting up a path for MCR
Our program is deployed on MATLAB. Hence, you should install MCR on your system. After installing MCR, you need to specify the installation path for MCR in ‘gst.cnf’ as follows:

```
# gst.cnf

MCR_PATH='/Applications/MATLAB/MATLAB_Runtime/v90'
```

If you already installed MATLAB, you can specify the installation path of MATLAB as MCR_PATH instead of installing MCR. The below is the example specifying the installation path of MATLAB in a linux system. 

```
# gst.cnf

MCR_PATH='/usr/local/MATLAB/R2015b'	
```

#### Setting up paths for a data graph
Before using our system, you need to specify the paths for a data graph in ‘gst.cnf’ as follows:

```
# gst.cnf
# paths for a data graph

ATTR='./data/attr'
NODE_ATTR_DOM='./data/node_attr_dom'
DATA_NODE_NODE='./data/data_node_node'
DATA_NODE_ATTR='./data/data_node_attr'
```

See the user guide for the example of those file for a data graph. 

### Running program

#### Constructing a query graph
To match or extract subgraphs, you need to construct a query graph, and pass the query graph into our program. See the user guide for the example of a query graph. 

#### Quick start
You can run our program using ‘demo.sh’ in the following way:
- Partial subgraph matching
```
$ sh demo.sh PARSUB
```
- Correlated subgraph extraction
```
$ sh demo.sh CORSUB
```
- Correlated node ranking
```
$ sh demo.sh CORANK
```

**NOTE:** Before running the demo script, you should specify the paths in gst.cnf. 


#### Partial subgraph matcing module
To match partial subgraph match for your query graph, you can use gst.sh. (demo.sh exploit the script to demonstrate our program.) Type the following command: 
```
$ sh gst.sh -n ./input/query_node_node -a ./input/query_node_attr -o ./output -t PARSUB
```

GST will search one result subgraph matched to the query graph. The files for the result subgraph will be stored at ‘./output’. The option –n means a file path for query_node_node. The option –a means a file path for query_node_attr. The option –o means a directory path for outputs. The option –t means the type of task. See the user guide for the detailed options for the command.  

If you want the top-3 subgraphs for the query graph, type the following command: 
```
$ sh gst.sh -n ./input/query_node_node -a ./input/query_node_attr -o ./output -t PARSUB –k 3
```

#### Correlated subgraph extraction module
To extract a correlated subgraph, type the following command: 
```
$ sh gst.sh -n ./input/query_node_node -a ./input/query_node_attr -o ./output -t CORSUB
```

GST will extract a correlated subgraph related to the query nodes in the query graph. The files for the result subgraph will be stored at ‘./output’. See the user guide for the detailed options for the command.


#### Correlated node ranking module
To rank nodes which are correlated to the query graph, type the following command:
```
$ sh gst.sh -n ./input/query_node_node -a ./input/query_node_attr -o ./output -t CORANK
```

GST will rank data nodes in order of centrality score. The centrality score means how much a node is correlated to the query graph. See the user guide for the detailed options for the command.

### User guide
The more detailed information is shown in the user guide (./doc/user_guide.pdf). 

> Written by Jinhong Jung

[1]: http://www.mathworks.com/products/compiler/mcr/index.

# myconf
dot files used in linux systems
