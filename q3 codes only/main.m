% Main script
inputAudioFile = 'music_pressure-cooker_hp.wav'; % Replace with the actual filename
% Step 1: Load the input audio file
audio = loadAudioFile(inputAudioFile);
% Step 2: Classify the noise
noiseType = classifyNoise(audio);
 
% Display the classification result
disp(['The detected noise type is: ' noiseType]);