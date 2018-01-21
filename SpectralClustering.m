function [ C, L, D, Q, V ] = SpectralClustering(W, k) % 
% spectral clustering algorithm
% input: adjacency matrix W; number of cluster k 
% return: cluster indicator vectors as columns in C; unnormalized Laplacian L; degree matrix D;
%         eigenvectors matrix Q;  eigenvalues matrix V �ԽǾ���

% calculate degree matrix
degs = sum(W, 2); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%sum(W,2)����������ͣ��õ�������
D = sparse(1:size(W, 1), 1:size(W, 2), degs);%%%%%%%%% ����һ���ԽǾ���Ԫ��Ϊdegs�е�Ԫ��

% compute unnormalized Laplacian 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   size(W,1)ָ���ǵ�һά�ȵĳ��ȣ�������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   size(W,2)�ǵڶ�ά�ȵĳ���
L = D - W;

% compute the eigenvectors corresponding to the k smallest eigenvalues
% diagonal matrix V is NcutL's k smallest magnitude eigenvalues 
% matrix Q whose columns are the corresponding eigenvectors.
[Q, V] = eigs(L, k, 'SA');

% use the k-means algorithm to cluster V row-wise
% C will be a n-by-1 matrix containing the cluster number for each data point
C = kmeans(Q, k);%%%%%%%%%%%%%%%%  C��һ������N��ָ��k������

% convert C to a n-by-k matrix containing the k indicator vectors as columns
C = sparse(1:size(D, 1), C, 1);

end