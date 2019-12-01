function [ A ] = SudokuBacktracker( A )
% SudokuBacktracker.m
%
% Copyright(c) 2019 Ahmad Bazzi
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files(the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and / or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions :
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
%
%The developer's email is bazziapps@gzixmail.com (for great email, take
% off every 'zix'.)
%

[C,s,e] = candidates(A);

while ~isempty(s) && isempty(e)
   A(s) = C{s};
   [C,s,e] = candidates(A);
   
end
if ~isempty(e)
    return
end
%% backtracking

if any(A(:) == 0)
   B = A;
   z = find(A(:) == 0,1);
   for x = [C{z}]
      A = B;
      A(z) = x;
      A = SudokuBacktracker(A);
      if all(A(:) > 0)
          return
      end
   end
    
end

%% 


function [C,s,e] = candidates(A)
% C: vector of candidates for each cell
% s: first cell with one candidate
% e: first cell with no candidates
C = cell(9,9);
for ii = 1:9
    for jj = 1:9
        if (A(ii,jj) == 0)
            row_mod = 3*ceil(ii/3-1) + (1:3);
            col_mod = 3*ceil(jj/3-1) + (1:3);
            z = 1:9;
            z(nonzeros(A(ii,:))) = 0;
            z(nonzeros(A(:,jj))) = 0;
            z(nonzeros(A(row_mod,col_mod))) = 0;
            C{ii,jj} = nonzeros(z)';
        end
    end
end
L = cellfun(@length,C);
s = find(A == 0 & L == 1,1);
e = find(A == 0 & L == 0,1);
end

end
