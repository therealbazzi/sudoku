function [ A ] = SudokuBacktracker( A )

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
