%Problems：
%1：require 3 channels
%2：size：227*227*3
%3：do one video each time to ensure all frameas coming from the same video
%tic; %count the time

position='/xxx/desktop/training';
in = input('Video or Image[v or i]:','s');
if in=='v'
    judge=ifVideo(position);
else
    judge=ifImage(position);
end
predict_transfer_alexnet(judge);

%change the 2 channels image to 3 channels 
%and reszie the image into 227*227

function out = ifVideo(position1)

video = VideoReader(position1);
numframe = video.NumFrames; %total number of frames

for i=1:10:numframe
    frame=read(video,i);
    imshow(frame);
    temp='/xxx/desktop/datasets/fire/';
    imwrite(frame,strcat(temp,num2str(i),'.jpg'),'jpg');
end 

path='/xxx/desktop/datasets/fire';
out=path;
end

function out=ifImage(path)
out=path;
end


function output=ImageProcessing(input)
input=imread(input);

if numel(size(input))==2
    input= cat(3,input,input,input);
end

output = imresize(input,[227,227]);
end

function predict_transfer_alexnet(path)
Location = path;

%read data
imdsTrain = imageDatastore(Location,'includeSubfolders',true,'LabelSource','foldernames','ReadFcn',@ImageProcessing);
%cout the labels
T = countEachLabel(imdsTrain);

%%train
%reset last 3 layers according to new problem
%increase the learning speed by increasing the  WeightLearnRateFactor and BiasLearnRateFactor

net = alexnet;
trainsferLayer = net.Layers(1:end-3);

numClasses = numel(categories(imdsTrain.Labels));
layers = [trainsferLayer;fullyConnectedLayer(numClasses,'WeightLearnRateFactor',50,'BiasLearnRateFactor',50);softmaxLayer();classificationLayer()];
options = trainingOptions('sgdm', 'MiniBatchSize',10, 'Maxepochs',8, 'InitialLearnRate',0.0001, 'Shuffle','every-epoch','Verbose',false, 'Plots','training-progress');
network = trainNetwork(imdsTrain,layers,options);


%testLabels = imds_test.Labels;
%accuracy = sum(predictLabels == testLabels)/numel(predictLabels);
disp(T);

%disp(['accuracy:',num2str(accuracy)]);
save network;
end

