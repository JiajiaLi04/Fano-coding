%%%Here we only count 26 lowercase letters and a space
file=fopen('test.txt','r');
m=fread(file);
n=size(m);
time=zeros(1,27);%An array holding the number of occurrences for each letter and space
p=zeros(1,27);%An array holding the probability of occurrence of each letter and space
time2=zeros(26,26);%Store the number of times the two letter combinations appear
p2=zeros(26,26);%Stores the probability that two letter combinations will appear


%%The number of occurrences of each lowercase letter
for i=1:26
    for j=1:n
        if (m(j)==96+i)
            time(i)=time(i)+1;
        end
    end
end
%%The number of spaces to appear
for j=1:n
    if (m(j)==32)
        time(27)=time(27)+1;
    end
end


%%Probability of occurrence of lowercase letters and spaces
sum=0;
for i=1:27
    sum=sum+time(i);
end
for i=1:27
    p(i)=time(i)/sum;
end



%%The number of lowercase letters combinations that appear
for i=1:26
    for j=1:n-1
        if(m(j)==96+i&&m(j+1)<=122&&m(j+1)>=97)
            k2=m(j+1)-96;
            time2(i,k2)=time2(i,k2)+1;
        end
    end
end

%%The number of occurrences for all combinations
sum2=0;
for i=1:26
    for j=1:26
        sum2=sum2+time2(i,j);
    end
end
for i=1:26
    for j=1:26
        p2(i,j)=time2(i,j)/sum2;
    end
end
%%%%%Calculate entropy
H1=0.00;
H2=0.00;
for i=1:27
    if(p(i)~=0)
    H1=H1+(p(i)*log2(1/p(i)));
    end
end
for i=1:26
    for j=1:26
        if(p2(i,j)~=0)
        H2=H2+(p2(i,j)*log2(1/p2(i,j)));
        end
    end
end


