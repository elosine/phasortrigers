(

s.sendMsg(\g_new, 2000);
s.sendMsg(\g_new, 2001, 3, 2000);
s.sendMsg(\g_new, 2002, 3, 2001);

SynthDef(\phasorClock, {
	arg obs, dur;
	var ph = Phasor.ar(0, (1.0/(44100.0*dur)) );
	Out.ar(obs, ph);
}).add;

SynthDef(\timedtrig, {
	arg ibs, obs, tinorm=0.5;
	var ph = In.ar(ibs);
	var tr = (ph>tinorm) * (ph<(tinorm+0.0001));
	Out.ar(obs, tr);
}).add;

SynthDef(\tsn, {
	arg ibs, freq=600;
	var tr = In.ar(ibs);
	var env = EnvGen.ar(Env.perc(0.01, 0.05, curve:0), tr);
	Out.ar(0, SinOsc.ar(freq)*env);
}).add;
)
s.sendMsg(\s_new, \phasorClock, 4000, 0, 2000, \obs, 49, \dur, 2.0);

s.sendMsg(\s_new, \timedtrig, 5000, 0, 2001, \ibs, 49, \obs, 55);
s.sendMsg(\s_new, \tsn, 6000, 0, 2002, \ibs, 55);


s.sendMsg(\s_new, \timedtrig, 5003, 0, 2001, \ibs, 49, \obs, 55, \tinorm, 0.0);
//4:1
s.sendMsg(\s_new, \timedtrig, 5001, 0, 2001, \ibs, 49, \obs, 58, \tinorm, 0.25);
s.sendMsg(\s_new, \timedtrig, 5011, 0, 2001, \ibs, 49, \obs, 58, \tinorm, 0.5);
s.sendMsg(\s_new, \timedtrig, 5002, 0, 2001, \ibs, 49, \obs, 58, \tinorm, 0.75);
//5:1
s.sendMsg(\s_new, \timedtrig, 5004, 0, 2001, \ibs, 49, \obs, 55, \tinorm, 0.2);
s.sendMsg(\s_new, \timedtrig, 5005, 0, 2001, \ibs, 49, \obs, 55, \tinorm, 0.4);
s.sendMsg(\s_new, \timedtrig, 5006, 0, 2001, \ibs, 49, \obs, 55, \tinorm, 0.6);
s.sendMsg(\s_new, \timedtrig, 5007, 0, 2001, \ibs, 49, \obs, 55, \tinorm, 0.8);
//7:1
s.sendMsg(\s_new, \timedtrig, 7001, 0, 2001, \ibs, 49, \obs, 59, \tinorm, 0.1428);
s.sendMsg(\s_new, \timedtrig, 7002, 0, 2001, \ibs, 49, \obs, 59, \tinorm, 0.2857);
s.sendMsg(\s_new, \timedtrig, 7003, 0, 2001, \ibs, 49, \obs, 59, \tinorm, 0.4285);
s.sendMsg(\s_new, \timedtrig, 7004, 0, 2001, \ibs, 49, \obs, 59, \tinorm, 0.5714);
s.sendMsg(\s_new, \timedtrig, 7005, 0, 2001, \ibs, 49, \obs, 59, \tinorm, 0.7142);
s.sendMsg(\s_new, \timedtrig, 7006, 0, 2001, \ibs, 49, \obs, 59, \tinorm, 0.8571);
//13:2
s.sendMsg(\s_new, \timedtrig, 8001, 0, 2001, \ibs, 49, \obs, 62, \tinorm, 0.1538);
s.sendMsg(\s_new, \timedtrig, 8002, 0, 2001, \ibs, 49, \obs, 62, \tinorm, 0.3077);
s.sendMsg(\s_new, \timedtrig, 8003, 0, 2001, \ibs, 49, \obs, 62, \tinorm, 0.4615);
s.sendMsg(\s_new, \timedtrig, 8004, 0, 2001, \ibs, 49, \obs, 62, \tinorm, 0.61538);
s.sendMsg(\s_new, \timedtrig, 8005, 0, 2001, \ibs, 49, \obs, 62, \tinorm, 0.7692);
s.sendMsg(\s_new, \timedtrig, 8006, 0, 2001, \ibs, 49, \obs, 62, \tinorm, 0.92367);


s.sendMsg(\n_free, 5001);
s.sendMsg(\n_free, 5002);
s.sendMsg(\n_free, 5000);
s.sendMsg(\n_free, 6005);


s.sendMsg(\s_new, \tsn, 6005, 0, 2002, \ibs, 57, \freq, 600);
s.sendMsg(\s_new, \tsn, 6006, 0, 2002, \ibs, 58, \freq, 800);
s.sendMsg(\s_new, \tsn, 6007, 0, 2002, \ibs, 59, \freq, 463);
s.sendMsg(\s_new, \tsn, 6008, 0, 2002, \ibs, 62, \freq, 955);

s.sendMsg(\n_set, 5003, \obs, 57);


s.sendMsg(\n_set, 4000, \dur, 2.2);

{Out.kr(80, SinOsc.kr(0.05).range(0.1, 3.0))}.play
s.sendMsg(\n_map, 4000, \dur, 80);
s.queryAllNodes;
s.sendMsg(\n_free, 1000);


/*
Get Dial going
Each Bullseye ring a different subdivision
    Lines with dots to indicate active
    Different colored dots for different source material or shapes
    Orientation in the ring indicates something
    Size indicates something
(multiple) cursors for each ring
     control speed and direction
     ways to sync all cursors and gradually meet

physical controllers

*/