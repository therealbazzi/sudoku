function [ flag ] = ConflictTest( A,row_i,col_j )
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
