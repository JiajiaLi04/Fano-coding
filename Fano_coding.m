clc;
clear;
%B=zeros(27,27);
%%Single probability
A=[0.0819,0.0099,0.0273,0.0273,0.0769,0.0074,0.0248,0.0223,0.0496,0,0.0025,0.0149,0.0248,0.0496,0.0819,0.0174,0,0.0645,0.0670,0.0720,0.0447,0.0124,0.0124,0,0.0372,0,0.1712];
A=fliplr(sort(A));%descending sort
[m,n]=size(A);
for i=1:n
    B(i,1)=A(i);%Generate the first column of B.
end
%Generate the B column 2 elements
a=sum(B(:,1))/2;
for k=1:n-1
    if abs(sum(B(1:k,1))-a)<=abs(sum(B(1:k+1,1))-a)
        break;
    end
end
for i=1:n%Generate the B column 2 elements
    if i<=k
        B(i,2)=0;
    else
        B(i,2)=1;
    end
end
%Generate the result of the first encoding
END=B(:,2)';
END=sym(END);
%Generate the third column and the next few elements
j=3;
while (j~=0)
    p=1;
    while(p<=n)
        x=B(p,j-1);
        for q=p:n
            if x==-1
                break;
            else
                if B(q,j-1)==x
                    y=1;
                    continue;
                else
                    y=0;
                    break;
                end
            end
        end
       if y==1
            q=q+1;
       end
       if q==p||q-p==1
            B(p,j)=-1;
       else
            if q-p==2
                B(p,j)=0;
                END(p)=[char(END(p)),'0'];
                B(q-1,j)=1;
                END(q-1)=[char(END(q-1)),'1'];
            else
                a=sum(B(p:q-1,1))/2;
                for k=p:q-2
                    if abs(sum(Bp:k,1))-a)<=abs(sum(B(p:k+1,1))-a);
                            break;
                    end
                end
                    for i=p:q-1
                        if i<=k
                            B(i,j)=0;
                            END(i)=[char(END(i)),'0'];
                        else
                            B(i,j)=1;
                            END(i)=[char(END(i)),'1'];
                        end
                    end
            end
        end
         p=q;
    end 
    C=B(:,j);
    D=find(C==-1);
    [e,f]=size(D);
    if e==n
        j=0;
    else
        j=j+1;
    end
end
B
A
END
for i=1:n
    [u,v]=size(char(END(i)));
    L(i)=v;
end
avlen=sum(L.*A);
H1=4.0685;
XiaoLv=H1/avlen
