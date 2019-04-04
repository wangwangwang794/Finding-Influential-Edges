function [A,p] = cie_CRhc(B,k)
    n=length(B);
    m=sum(sum(B));
    d=sum(B);
    CIE=zeros(n);
    G=graph(B);
    B=B/1;
    B1=sparse(B);
    [b,E] = betweenness_centrality(B1);
    E=full(E); E=E/1;
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
    p=0;
    A=B;
    b=argmax(CIE);
    b1=b(1,1); b2=b(1,2);
    A(b1,b2)=0; A(b2,b1)=0; 
end
