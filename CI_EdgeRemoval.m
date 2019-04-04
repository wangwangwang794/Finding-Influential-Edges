Mat=Z;
iter=1;
repeat=1;
pl2=zeros(100,2);
k=2;
while max(dismantle(Mat))<50
    [Mat,l]=cie4(Mat,k);
    if l==1
        k=k-1;
        if k<0
            break;
        end
        [Mat,l]=cie3(Mat,k);
    end
    pl2(iter,2)=max(listdismantle(Mat));
    pl2(iter,3)=cost(listdismantle(Mat));
    pl2(iter,1)=iter;
    if iter>100
        break;
    end
    disp(iter);
    disp('-----------------');
    iter=iter+100;
    mx=max(dismantle(Mat));
    if mx>repeat
        %G3=graph(Mat);
        %plot(G3);
        disp('component removed');
        %pause;
    end
    repeat=mx;
end
