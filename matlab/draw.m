% a = (1:arv);
format long 


%log_name = ...
%sprintf('/home/wanghao/Documents/Rox_vs_OpenFlow/matlab/data-rvo-1)',...
%time_stamp);

data_file = ...
    '/home/wanghao/Documents/Rox_vs_OpenFlow/matlab/rtt-1-2-5-avg.xlsx';

% data_fd = fopen(data_file);
% data = importdata(data_f, '\t');

sheet = 1;
t1Range = 'A1:A623';
ofpRange = 'B1:B591';
t2Range = 'A1:A591';
roxRange = 'C1:C623';

t1 = xlsread(data_file, sheet, t1Range);
t2 = xlsread(data_file, sheet, t2Range);
ofp = xlsread(data_file, sheet, ofpRange);
rox = xlsread(data_file, sheet, roxRange);

% ofp = ofp * 1000;
% rox = rox * 1000;


% data;

% Util1 = mean(U1');
% Util2 = mean(U2');
% Util3 = mean(U3');
% Accp1 = mean(z1');
% Accp2 = mean(z2');
% Accp3 = mean(z3');

% write2file(fid, log_name,'Util1', Util1);
% write2file(fid, log_name,'Util2', Util2);
% write2file(fid, log_name,'Util3', Util3);
% write2file(fid, log_name,'Accp1', Accp1);
% write2file(fid, log_name,'Accp2', Accp2);
% write2file(fid, log_name,'Accp3', Accp3);

h = figure('visible', 'on');
% fig_name = ...
% sprintf('/home/wanghao/Documents/MAT_results/%s',...
% time_stamp);

fig_name = ...
    '/home/wanghao/Documents/Rox_vs_OpenFlow/matlab/data-rvo-1-f';

% scatter(t1, rox);

hold on

box on

set(gcf, 'Position', [0 0 900 400]);


plot(t1, rox,'ro-',t2,ofp,'bx-','LineWidth',1, 'MarkerSize', 6);
xlabel('Number of Packets','FontSize',10);
ylabel('RTT (s)','FontSize',10);
leg = legend('Rox', 'OpenFlow');

set(gca, 'XTick', 0:5000:65000);

% axis([0 65000 0 6]);
% set(gca, 'xTick', 0:5000:70000);

% 
% plot(t1, rox);
% plot(t2, ofp);
% scatter(t, ofp);
% plot(a,Util1,'ro-',...
% a,Util2,'gs-',...
% a,Util3,'bd-',...
% a,Accp1,'r--o',...
% a,Accp2,'g--s',...
% a,Accp3,'b--d',...
% a,(1-Accp1),'r-.o',...
% a,(1-Accp2),'g-.s',...
% a,(1-Accp3),'b-.d',...
% 'LineWidth',1)
grid on;

xlim([0. 65000]);

saveas(gca, fig_name, 'epsc');

hold off


