function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = ones(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

m = size(X)(1)
cent = repmat(centroids(1,:),size(X)(1),1);
dist = sqrt(sum((X-cent).^2,2))

for i=2:K
  cent = repmat(centroids(i,:),size(X)(1),1);
  new_dist = sqrt(sum((X-cent).^2,2))
  cond1 = new_dist >= dist
  cond2 = new_dist < dist
  idx = i.*cond2 + idx.*cond1
  dist = min(dist, new_dist)
endfor

% =============================================================

end

