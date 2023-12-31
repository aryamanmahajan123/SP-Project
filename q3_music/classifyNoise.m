function noiseType = classifyNoise(audio)
 
%when testing for music files as input, here music files should be entered in respective category. If testing  for speech fiile as input, in the following four files the speech files must be entered. 


[fan,fs1] = audioread("music_ceiling-fan_hp.wav");

[traffic,fs2] = audioread("music_city-traffic_hp.wav");

[cooker,fs3] = audioread("music_pressure-cooker_hp.wav");

[pump,fs4] = audioread("music_water-pump_hp.wav");


fan_pump = fan-pump;
fan_traffic= fan-traffic;
fan_cooker=fan-cooker;
pump_traffic = pump-traffic;
pump_cooker= pump - cooker;
traffic_cooker=traffic-cooker;

correlation1 = xcorr(audio,fan_pump);
correlation2 = xcorr(audio,fan_traffic);
correlation3 = xcorr(audio,fan_cooker);
correlation4 = xcorr(audio,pump_traffic);
correlation5 = xcorr(audio,pump_cooker);
correlation6 = xcorr(audio,traffic_cooker);



a=zeros(6,1);

a(6)=max(abs(correlation6));
a(5)=max(abs(correlation5));
a(4)=max(abs(correlation4));
a(3)=max(abs(correlation3));
a(2)=max(abs(correlation2));
a(1)=max(abs(correlation1));


%find the three max correlating graphs

indices=zeros(3,1);

for p =1:3

    b = max(a);

for i =1:6
    if(a(i)==b)
        indices(p)=i;
    end
end

a(indices(p))=0;
end



if(indices(1)==1 && indices(2)==2 && indices(3)==3 || indices(1)==2 && indices(2)==3 && indices(3)==1 || indices(1)==3 && indices(2)==1 && indices(3)==2 || indices(1)==3 && indices(2)==2 && indices(3)==1 || indices(1)==2 && indices(2)==3 && indices(3)==1 || indices(1)==1 && indices(2)==3 && indices(3)==2 )
    noiseType='fan';



elseif(indices(1)==1 && indices(2)==4 && indices(3)==5 || indices(1)==1 && indices(2)==5 && indices(3)==4 || indices(1)==4 && indices(2)==1 && indices(3)==5 || indices(1)==4 && indices(2)==5 && indices(3)==1 || indices(1)==5 && indices(2)==4 && indices(3)==1 || indices(1)==5 && indices(2)==1 && indices(3)==4 )
    noiseType='pump';



elseif(indices(1)==3 && indices(2)==5 && indices(3)==6 || indices(1)==3 && indices(2)==6 && indices(3)==5 || indices(1)==6 && indices(2)==5 && indices(3)==3 || indices(1)==6 && indices(2)==3 && indices(3)==5 || indices(1)==5 && indices(2)==3 && indices(3)==6 || indices(1)==5 && indices(2)==6 && indices(3)==3 )
    noiseType='cooker';


elseif(indices(1)==2 && indices(2)==4 && indices(3)==6 || indices(1)==2 && indices(2)==6 && indices(3)==4 || indices(1)==6 && indices(2)==4 && indices(3)==2 || indices(1)==6 && indices(2)==2 && indices(3)==4 || indices(1)==4 && indices(2)==2 && indices(3)==6 || indices(1)==4 && indices(2)==6 && indices(3)==2 )
    noiseType='traffic';


else
    noiseType='unknown';
end
end
