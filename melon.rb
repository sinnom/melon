# Melon

core=45 # The new "0" note.
melody = [[24, 2], [19, 2], [19, 1], [17, 1], [16, 2],
          [14, 1], [16, 1], [17, 1], [19, 1], [16, 4]].ring

live_loop :bass_loop do
  play_bass core
  sleep 1
end

live_loop :melody do
  counter = 0
  with_fx :gverb, amp: 0.5 do
    play_honeydew melody.tick[0]
    sleep melody.look[1]
  end
end

define :play_bass do |n|
  use_synth :fm
  play n, amp: 0.25, attack: 2, release: 2
end

define :play_honeydew do |n|
  use_synth :piano
  play core + n, attack: 0.25, sustain: 0.5, release: 0.5
end
