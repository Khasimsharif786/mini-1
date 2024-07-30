% Specify the path to the image dataset
datasetDir = 'dataset';

% Create an imageDatastore
imds = imageDatastore(datasetDir, ...
    'IncludeSubfolders', true, ...
    'LabelSource', 'foldernames');

% Split the datastore into training (70%), validation (10%), and test (20%) sets
[imdsTrain, imdsVal,imdsTest] = splitEachLabel(imds, 0.7,0.1);
% Create the output directories
outputDir = 'new';
trainDir = fullfile(outputDir, 'train');
valDir = fullfile(outputDir, 'validation');
testDir = fullfile(outputDir, 'test');

% Save the images
saveDatastoreImages(imdsTrain, trainDir);
saveDatastoreImages(imdsVal, valDir);
saveDatastoreImages(imdsTest, testDir);

disp(['Datasets are split and saved in the "' outputDir '" directory.']);

% Function to save images from an imageDatastore to a specified directory
function saveDatastoreImages(imds, outputDir)
    % Create output directory if it doesn't exist
    if ~exist(outputDir, 'dir')
        mkdir(outputDir);
    end
    
    % Loop over each file in the imageDatastore
    while hasdata(imds)
        [img, info] = read(imds);
        % Create class-specific directory
        classDir = fullfile(outputDir, char(info.Label));
        if ~exist(classDir, 'dir')
            mkdir(classDir);
        end
        % Save the image to the class-specific directory
        [~, fileName, ext] = fileparts(info.Filename);
        imwrite(img, fullfile(classDir, [fileName, ext]));
    end
end

