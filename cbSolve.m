function cbSolve(src,event,h)
%% Read my sudokugui
sudokugui = get(h,'UserData');
for ii = 1:9
    for jj = 1:9
        string_ij = get(sudokugui.X(ii,jj),'string');
        if(isempty(string_ij))
            A(ii,jj) = 0;
        else
            A(ii,jj) = str2double(string_ij);
        end
    end
end
%% Handle any sort of invalid cells 
for ii = 1:9
    for jj = 1:9
        if(A(ii,jj) > 9 || A(ii,jj) < 0 || isnan(A(ii,jj)))
           set(sudokugui.status,'string','ERROR: The cell entries must be between 0 and 9 !!');
           return
        end
    end
end
%% Handle any type of conflicts 
for ii = 1:9
    for jj = 1:9
        if(A(ii,jj)~=0)
            if (ConflictTest(A,ii,jj) == 0)
                set(sudokugui.status,'string','CONFLICT')
                return
            end
        end
    end
end
%% Solve my Sudoku
A_sol = SudokuBacktracker(A);
%% Prompt the user that Sudoku is solved
set(sudokugui.status,'string','SOLVED')
for ii = 1:9
    for jj = 1:9
     set(sudokugui.X(ii,jj),'string',num2str(A_sol(ii,jj))) 
     set(sudokugui.X(ii,jj),'fontweight','normal')
    end
end
