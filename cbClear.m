function cbClear(src,event,h)

sudokugui = get(h,'UserData');

for ii = 1:9
    for jj = 1:9
        set(sudokugui.X(ii,jj),'string',[]);
    end
end
set(sudokugui.status,'string','Hit SOLVE to solve me, again !!');

