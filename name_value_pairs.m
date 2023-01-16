function f = name_value_pairs(varargin)

% Function written by Eleni Christoforidou in MATLAB R2022b.

% This function has a variable number of input arguments representing 
% name-value pairs. The first is the name (char type), the next is the 
% value (any data type). This means that the function must be called with 
% an even number of actual input arguments. The function returns a single 
% cell array which has two columns. The first column contains the names, 
% while the second column contains the values. If the function is called 
% with no input arguments, or it is called with an odd number of inputs or 
% if a name is not of char type, the function returns an empty cell array.

% Example:
% >> f = name_value_pairs('name','John Smith','age',32,'children',{'Joe' 'Jill'})
% f =
%   3x2 cell array
%     {'name'    }    {'John Smith'}
%     {'age'     }    {[        32]}
%     {'children'}    {1x2 cell    }

list=varargin;
charIndices = cellfun(@ischar, list); %check which elements are character arrays
oddIndices=charIndices(1:2:end);
if nargin==0 || mod(nargin,2)==1 || sum(oddIndices)~=length(oddIndices)
    f={};
else
    f=cell(nargin/2,2);
    count=0;
    for i=1:nargin/2
        if mod(i,2)==1
            f(i,1)=list(count+1);
            f(i,2)=list(count+2);
            count=count+1;
        else
            f(i,1)=list(count+2);
            f(i,2)=list(count+3);
            count=count+3;
        end
    end
end
end