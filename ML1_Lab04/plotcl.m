function plotcl(X, Xlbl, coord,psize)
    colors = [ ...
      1 0 0; ...
      0 0 1; ...
      0 1 0; ...
      1 0 .5; ...
      .5 0 0; ...
      0 .5 0; ...
      0 0 .5; ...
      1 .5 0; ...
      .5 1 0; ...
      .5 0 1; ...
      0 1 .5; ...
      0 .5 1; ...
      .5 .5 0; ...
      .5 0 .5; ...
      0 .5 .5 ...
    ];
    pointstyles = 'o+*xsd^v><ph'; 
    
    psz=2;
    if nargin<3
        coord=1:min(3,size(X,2));
    end
    if nargin>3
      psz = psize(1);
    end
    X=X(:,coord);
    for h=1:max(Xlbl)
        cc = colors(mod(h-1,size(colors,1))+1,:);
        ps = pointstyles(mod(h-1,length(pointstyles))+1);
        select = Xlbl==h;
        if size(X,2)==1
            plot(X(select,1),X(select,1),ps,'Color',cc,'MarkerSize',psz,'LineWidth',log(psz+1)+1);
        elseif size(X,2)==2
            plot(X(select,1),X(select,2),ps,'Color',cc,'MarkerSize',psz,'LineWidth',log(psz+1)+1);
        else
            plot3(X(select,1),X(select,2),X(select,3),ps,'Color',cc,'MarkerSize',psz,'LineWidth',log(psz+1)+1);
        end
        hold on
        names{h}=sprintf('%i',h);
    end
    hold off
    legend(names,'Location','best');
end
