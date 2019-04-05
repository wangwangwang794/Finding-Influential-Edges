# Finding-Influential-Edges
Any complex network can broken down into multiple disconnected components, by removing a small fraction of the edges (or nodes) of the
network. Finding these edges, or nodes, is an important problem in many domains. However, the problem falls into the NP class,
and therefore finding an approximate solution to this problem is essential. Many approaches have been suggested for the case of identifying important nodes in a network. This repository contains the implementation of various approaches I have tried to find the approximate solutions to the problem of finding the most influential edges in a network. 

Following is the description of the codes-

CI_EdgeRemoval.m - To run an algorithm to test over a network

CImm.m - Implementation of the collective influence (CI) algorithm by Prof. Hernan Makse (CUNY) to find the important nodes in a network

ci_edges.m - Extended approach of the CI algorithm to edges

ci_int.m - A novel approach that gives better results than ci_edges.m

cie4.m - Implementing the idea that an important edge must be a part of maximum cycles

cie_CRhc.m - Implementing an idea that betweeness centrality, no. of cliques and the degree of connected nodes must be a good indicator of the importance of the edge (High Complexity)

cie_SR.m - Another novel approach involving a generalised Jaccard's similarity ce

ss_and_sb.m - Important nodes can either be the ones that tend to be the most influential (in context of spreading) or the ones which upon
removal break down the network into disconnected components. This code finds these nodes and compares them.
