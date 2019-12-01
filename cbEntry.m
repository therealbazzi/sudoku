function [ output_args ] = cbEntry( src,event,h,ii,jj)

sudokugui = get(h,'UserData');

set(sudokugui.X(ii,jj),'FontWeight','bold')
