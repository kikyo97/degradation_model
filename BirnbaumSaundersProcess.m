%% Y(t)�����߂�
x = importdata('jumpsizedata.txt');
x = reshape(x,[1,240]);
phatBirmbaumSaunders = mle(x,'distribution','BirnbaumSaunders') % Birnbaum-Saunders���z�̃p�����[�^����
beta =  phatBirmbaumSaunders(1,1);
gamma =  phatBirmbaumSaunders(1,2);
meann = 1000; % ����t�̒l�ŁAY(t)�𔭐��������
Y = 0;
for t = 0:250:4000
    pd = makedist('BirnbaumSaunders','beta',beta,'gamma',gamma);
    for j = 1:meann
        increments = random(pd); % ����Y(t)-Y(s)��Birnbaum-Saunders���z�ɏ]��
        Y = Y + increments;
        if t == 0 % t=0�̂Ƃ��AY(0)=0
            Y = 0;
        end
    end
    filename = sprintf('BirnbaumSaunders.txt');
    fileID = fopen(filename,'a');
    fprintf(fileID,'%f\r\n',Y);
    fclose(fileID);
end

%% ���[�U�[�f�[�^��Y(t)�̃v���b�g
laserdata = importdata('degradationLaser.txt');
x = [0,250,500,750,1000,1250,1500,1750,2000,2250,2500,2750,3000,3250,3500,3750,4000];
for i=1:15
    L = laserdata(:,i);
    y = L;
    hold on
    plot(x,y,'k')
end

hold on
filename = sprintf('BirnbaumSaunders.txt');
Y = importdata(filename);
y = Y/meann;
p = plot(x,y,':o','LineWidth',1,'color','m');
delete(filename);
   
xlabel('Hours')                                 % x-axis label
ylabel('Percent Increase in Operating current') % y-axis label
hline = refline([0 10]);
hline.Color = 'k';
hline.LineStyle = ':';

%% ���[�U�[�f�[�^�ƃq�X�g�O����(t=4000)
f2 = figure;
figure(f2);
laserdata = importdata('degradationLaser.txt');  
L = laserdata(17,:)-laserdata(16,:);
h = histogram(L,'Normalization','pdf');
h.NumBins = 12;
hold on

x = 0:.01:1.5;
pdf_BirnbaumSaunders = pdf(pd,x);
plot(x,pdf_BirnbaumSaunders,'LineWidth',2,'color','m')
hold off

%% �ΐ��ޓx��AIC�̌v�Z
x = importdata('jumpsizedata.txt');
x = reshape(x,[1,240]);

beta =  phatBirmbaumSaunders(1,1);
gamma =  phatBirmbaumSaunders(1,2);
pd = makedist('BirnbaumSaunders','beta',beta,'gamma',gamma);
pdf_BirnbaumSaunders = pdf(pd,x);
logL = sum(log(pdf_BirnbaumSaunders))
[aic,bic] = aicbic(logL,2,240)

[h,p,a] = adtest(x,'Distribution',pd)
