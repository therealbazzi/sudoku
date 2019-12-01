function [ flag ] = ConflictTest( A,row_i,col_j )
% ConflictTest.m
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

flag = 0;
%% Column test
for ii = 1:9
   if ii~=row_i
      if A(ii,col_j) == A(row_i,col_j)
          return
      end
   end
end

%% Row test
for jj = 1:9
    if jj~=col_j
        if A(row_i,jj) == A(row_i,col_j)
           return 
        end
    end
end
%% 3x3 grid tests
modRow = mod(row_i-1,3);
modCol = mod(col_j-1,3);
row_l  = row_i - modRow;
col_l  = col_j - modCol;
for ii = row_l:row_l+2
    for jj = col_l:col_l+2
        if(ii~=row_i) || (jj~=col_j)
           if A(ii,jj) == A(row_i,col_j)
              return 
           end
        end
    end
end
flag=1;
