
% Class: MACM 316
% Title: Setup matrices for page rank problem
% Instructor: Bamdad Hosseini
% File name: Setup_Page_Rank.m

load harvard500.mat

G = full(G);
N = size(G,1);
p = 0.85; dd = (1 - p)/N;

%PARTa--------------------------------------------------------------
c = sum(G,1)';
z = ((1- p)*(c~=0) + (c==0))/N;
invser_c=ones(N,1);
for k=1:N
        
    
    invser_c(k)=1/c(k);
end

D=diag(invser_c);
infindx = find(D == Inf);
D(infindx) = 0;

A = p*G*D + ones(N, 1)*z';

x_0 = ones(N,1)./N;
x = x_0;

for j = 1:15
 
          x = A*x;
          x = x./norm(x);
end

cellx=num2cell(x);
merge_two=[U,cellx];

[trash, idx] = sort(cell2mat(merge_two(:,2)), 'descend');%sort cells by value of x
rank_table=merge_two(idx(1:5),:);
 
URL=rank_table(:,1);
X=rank_table(:,2);
T=table(URL,X);%create a table
 disp(T);

%PART b--------------------------------------------------------------

times = zeros(8,1); % Vector of timing data for Ntr trials
kvalue= zeros(8,1);

index=1;
for i=4:11
     k = 2^i;
     kvalue(index)=k;    
     tic;
      for j = 1:k
       x = A*x;
       x = x./norm(x);
      end
      times(index) = toc;
      index=index+1;
end



loglog(kvalue,times,'r--');
%PART c--------------------------------------------------------------

times_c = zeros(8,1); % Vector of timing data for Ntr trials
kvalue_c= zeros(8,1);

index=1;
for i=4:11
     k = 2^i;
     kvalue_c(index)=k;   
     x = x_0;
     G = sparse(G);
     D = sparse(D);
     GG = p*G*D;
     tic;
      for j = 1:k
          x = GG*x + ones(N,1)*(z'*x);
          x = x./norm(x);
      end
      times_c(index) = toc;
      index=index+1;
end


hold on;
loglog(kvalue_c,times_c,'b--');
title('Operation time VS value of k');
xlabel('k value');
ylabel('time');

