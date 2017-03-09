%%SETUP_Twostream
%
%setup the environment
%
%

if(isempty(gcp('nocreate')))
    parpool;
end

addpath('../GUI/');
addpath('Run_test/');
addpath('utils');
addpath('models');
