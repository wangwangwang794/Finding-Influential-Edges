function [PL] = cie_SR(B)
    n=length(B);
    m=sum(sum(B));
    d=sum(B);
    CIE=zeros(n);
    G=graph(B);
    B=B/1;
    B1=sparse(B);
    [b,E] = betweenness_centrality(B1);
    E=full(E); E=E;
    for i=1:n-1
        for j=i+1:n
            if B(i,j)==1
                Ni=nearest(G,i,1); Nj=nearest(G,j,1);         
                Cin=intersect(Ni,Nj);
                Cint=length(Cin);
                NM=B(Cin,Cin);
                Cliques=sum(sum(NM))/2;
                a=0;
                if Cliques==0
                    a=1;
                end
                CIE(i,j)=E(i,j)*d(i)*d(j)/(a+Cliques+Cint);
            end
        end
    end
    CIE=CIE+CIE';
    p=0; PL=zeros(m-1,2);
    A=B;
    for i=1:m/2-1
        b=argmax(CIE);
        b1=b(1,1); b2=b(1,2);
        A(b1,b2)=0; A(b2,b1)=0; 
        CIE(b1,b2)=0; CIE(b2,b1)=0;
        PL(i,2)=max(listdismantle(A));
        PL(i,3)=1-cost(listdismantle(A));
        PL(i,1)=i;
    end
end
