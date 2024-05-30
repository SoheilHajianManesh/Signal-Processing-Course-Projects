predictLabels=TrainedModel.predictFcn(diabetestraining);
labels=table2array(diabetestraining(:,7));
goodPredict=0;
for i=1:size(labels,1)
    if(labels(i,1)==predictLabels(i,1))
        goodPredict=goodPredict+1;
    end
end
success=goodPredict/size(labels,1);
success*100