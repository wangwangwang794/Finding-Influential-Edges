%Given a network of size n, find K nodes such that upon removal the network
%will be dismantled and k nodes such that the spreading phenomenon is fastest
M=Z2;
n=length(M); K=3;
%for each triplet of nodes we will find the dismantlement upon removal of
%the nodes
Mcur=M;
best1=[1 2 3];
cos=0;
for i=1:n-2
    for j=i+1:n-1
        for k=j+1:n
            Mcur=M;
            nodes=[i j k];
            Mcur=delnode(Mcur,nodes);
            h=listdismantle(Mcur);
            newcost=cost(h);
            if newcost>cos
                best1=nodes;
                cos=newcost;
            end
        end
    end
end
            
%Code above works perfectly!
%To find the 3 best superspreaders, use the approach used in SI. Find the
%three nodes such that the info is transmitted to the entire network
%fastest!

Mcur=M;
best2=[1 2 3];
cos=n;
for i=1:n-2
    for j=i+1:n-1
        for k=j+1:n
            nodes=[i j k];
            newcost=spreadtime(M,nodes);
            if newcost<cos
                best2=nodes;
                cos=newcost;
            end
        end
    end
end

disp(best1);
disp(best2);

            
            
            