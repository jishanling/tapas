function [ntheta] = tapas_sem_seri_invgamma_ptrans(theta, dir)
%% Transforms the parameters to their native space 
%
% Input
%   theta       Matrix with parameters 
%
% Output
%   ntheta      Transformation of the parameters

% aponteeduardo@gmail.com
% copyright (C) 2015
%


DIM_THETA = tapas_sem_seri_ndims();

n = 2;
if nargin < 2
    dir = 1;
end

etheta = exp(theta);
ntheta = etheta;
for i = 1:(size(theta, 1)/DIM_THETA)
    it = DIM_THETA * (i - 1) + [1 3 5 9 11 13];
    ntheta(it) = tapas_trans_mv2gk(etheta(it), etheta(it + 1)) + 2;
    ntheta(it + 1) = tapas_trans_mv2gt(etheta(it), etheta(it + 1));

    it = DIM_THETA * (i - 1) + [7 8 15 16 20];
    ntheta(it, :) = atan(theta(it, :))./pi + 0.5;
end


end % tapas_sem_seri_invgamma_ptrans 

