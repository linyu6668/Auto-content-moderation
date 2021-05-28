load network;
name='/xxx/desktop/datasets/video1';
type='.mp4';

for j=1:2
    t=[num2str(j),type];
    position=fullfile('/xxx/desktop/datasets/video1/',t);
    video=VideoReader(position);
    numframe = video.NumFrames; %total number of frames
    
    cd('/xxx/desktop/datasets');
    mkdir temp;
    
    for i=1:10:numframe
        frame=read(video,i);
        imshow(frame);
        temp='/xxx/desktop/datasets/temp/';
        imwrite(frame,strcat(temp,num2str(i),'.jpg'),'jpg');
    end 

    test_p='/xxx/desktop/datasets/temp';
    imds_test = imageDatastore(test_p,'includeSubfolders',true,'LabelSource','foldernames','ReadFcn',@ImageProcessing);
    [predictLabels,scores] = classify(network,imds_test);
    %%%%%%%%plot result images%%%%%
    idx = randperm(numel(imds_test.Files),length(predictLabels));
    figure
    for x = 1:length(predictLabels)
        subplot(ceil(length(predictLabels)/5),5,x)
        I = readimage(imds_test,idx(x));
        imshow(I)
        label = predictLabels(idx(x));
        Name = [num2str(x), '.jpg'];
        title(string(label) + "," + num2str(100*max(scores(idx(x),:)),3) + "%");
    end
    
    %%%%%%%%check if the video is the target video%%%%%%%
    counter1=0;
    counter2=0;
    counter3=0;
    for k=1:length(predictLabels)
        if predictLabels(k)=="fire"
            counter1=counter1+1;
        elseif predictLabels(k)=="candle"
            counter2=counter2+1;
        elseif predictLabels(k)=="not fire"
            counter3=counter3+1;
        end
    end
    
    %%%%%%%save the target video%%%%%%%%
    filepath=pwd;
    if counter1>=counter2 & counter1>=(length(predictLabels)/2)      
        cd ('/xxx/desktop/datasets/video1');
        oldname = t;
        newname = 'target.mp4';
        eval(['!mv' 32 oldname 32 newname]); 
        copyfile '/xxx/desktop/datasets/video1/target.mp4' /xxx/desktop/datasets/target;

        oldname1 = t;
        newname1 = 'target.mp4';
        eval(['!mv' 32 newname1 32 oldname1]); 
        
        cd ('/xxx/desktop/datasets/target');
        oldname2 = t;
        newname2 = 'target.mp4';
        eval(['!mv' 32 newname2 32 oldname2]); 
        cd(filepath);
    end
    rmdir('temp', 's');

end

function output=ImageProcessing(input)
input=imread(input);

if numel(size(input))==2
    input= cat(3,input,input,input);
end

output = imresize(input,[227,227]);
end

