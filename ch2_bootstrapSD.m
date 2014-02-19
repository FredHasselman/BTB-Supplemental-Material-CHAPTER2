%% Supplementary Material to "Beyond the Boundary - Chapter 2"
%
%%% Introduction
% This script can be used to reproduce the bootstrap analysis from the 2nd Chapter of Beyond the Boundary
%
% This is not a proper function or toolbox, it is not optimized for speed or functionality or aestetics! 
% Evaluate the code per Cell (using MATLAB's Cell Mode) and inspect the workspace to see what is going on.
%
%
%% Toolboxes / Scripts / Files used
%
% * See the <http://osf.io/9mtpq *OSF project page*> to download the required files 
% 
%% Author / Version
%
% Created by: <http://fredhasselman.com/?cat=9 *Fred Hasselman*> / January 2007 (1st version)
%
% Affiliations: <http://www.ru.nl/bsi _Behavioural Science Institute_> -
% <http://www.ru.nl _Radboud University Nijmegen_>
%
% Please quote if you use this code:
%
% |Hasselman, F., (2014). Beyond The Boundary - 2nd Chapter: Supplemental Materials. 
%  Retrieved from Open Science Framework, osf.io/9mtpq|
%
% Contact: me@fredhasselman.com

%% Safe workspace management
Now = int2str(round(now));
save([Now,'.mat'])
keep Now

%% Load data

YOURPATH = pwd; %Insert path to where the data are stored
cd(YOURPATH)
load('vars_ident');

runs     = 10000;
outfile0 = zeros(runs,6);
outfile1 = zeros(runs,6);
outfile2 = zeros(runs,6);
outfile3 = zeros(runs,6);

% The df F-ratio to which all resamples are tested have to be known in advance.
% They can be found in found in ch2_fratios.xls
expratio0 = 2.076007414;
expratio1 = 2.415655079;
expratio2 = 3.332871497;
expratio3 = 1.756042555;

for i=1:runs
    ss9   = 0;
    ss29  = 0;
    mss8  = 0;
    mss28 = 0;
    ratio = 0;
    x     = randperm(length(rt0));
    nine  = find(x<=9);
    tnine = find(x>9);
    for j=1:9
        rind9  = nine(j);
        ss9    = ss9 + rt0(rind9);
    end
    mss8  = ss9/8;
    for k=1:29
        rind29 = tnine(k);
        ss29   = ss29 + rt0(rind29);
    end
    mss28 = ss29/28;
    ratio = mss8/mss28;
    outfile0(i,1) = ss9;
    outfile0(i,2) = ss29;
    outfile0(i,3) = mss8;
    outfile0(i,4) = mss28;
    outfile0(i,5) = ratio;
    if ratio >= expratio0
        outfile0(i,6) = 1;
    else
        outfile0(i,6) = 0;
    end
end

sumabove1 = sum(outfile0(:,6));
pvalue0   = sumabove1 / runs;

for i=1:runs
    ss9   = 0;
    ss29  = 0;
    mss8  = 0;
    mss28 = 0;
    ratio = 0;
    x     = randperm(length(rt1));
    nine  = find(x<=9);
    tnine = find(x>9);
    for j=1:9
        rind9  = nine(j);
        ss9    = ss9 + rt1(rind9);
    end
    mss8  = ss9/8;
    for k=1:29
        rind29 = tnine(k);
        ss29   = ss29 + rt1(rind29);
    end
    mss28 = ss29/28;
    ratio = mss8/mss28;
    outfile1(i,1) = ss9;
    outfile1(i,2) = ss29;
    outfile1(i,3) = mss8;
    outfile1(i,4) = mss28;
    outfile1(i,5) = ratio;
    if ratio >= expratio1
        outfile1(i,6) = 1;
    else
        outfile1(i,6) = 0;
    end
end

sumabove1 = sum(outfile1(:,6));
pvalue1   = sumabove1 / runs;

for i=1:runs
    ss9   = 0;
    ss29  = 0;
    mss8  = 0;
    mss28 = 0;
    ratio = 0;
    x     = randperm(length(rt2));
    nine  = find(x<=9);
    tnine = find(x>9);
    for j=1:9
        rind9  = nine(j);
        ss9    = ss9 + rt2(rind9);
    end
    mss8  = ss9/8;
    for k=1:29
        rind29 = tnine(k);
        ss29   = ss29 + rt2(rind29);
    end
    mss28 = ss29/28;
    ratio = mss8/mss28;
    outfile2(i,1) = ss9;
    outfile2(i,2) = ss29;
    outfile2(i,3) = mss8;
    outfile2(i,4) = mss28;
    outfile2(i,5) = ratio;
    if ratio >= expratio2
        outfile2(i,6) = 1;
    else
        outfile2(i,6) = 0;
    end
end

sumabove1 = sum(outfile2(:,6));
pvalue2   = sumabove1 / runs;

for i=1:runs
    ss9   = 0;
    ss29  = 0;
    mss8  = 0;
    mss28 = 0;
    ratio = 0;
    x     = randperm(length(rt3));
    nine  = find(x<=9);
    tnine = find(x>9);
    for j=1:9
        rind9  = nine(j);
        ss9    = ss9 + rt3(rind9);
    end
    mss8  = ss9/8;
    for k=1:29
        rind29 = tnine(k);
        ss29   = ss29 + rt3(rind29);
    end
    mss28 = ss29/28;
    ratio = mss8/mss28;
    outfile3(i,1) = ss9;
    outfile3(i,2) = ss29;
    outfile3(i,3) = mss8;
    outfile3(i,4) = mss28;
    outfile3(i,5) = ratio;
    if ratio >= expratio3
        outfile3(i,6) = 1;
    else
        outfile3(i,6) = 0;
    end
end

sumabove1 = sum(outfile3(:,6));
pvalue3   = sumabove1 / runs;

% Check this variable to get the p vaulues
pvalues = [pvalue0,pvalue1,pvalue2,pvalue3];
pvalues


%% Safe workspace management 
keep Now
load([Now,'.mat'])
clear Now

