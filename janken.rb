class Jankengame

  def initialize
    @janken_result = ""
  end

  puts "じゃんけん..."  

  def janken
    puts "0.(グー) 1.(チョキ) 2.(パー) 3.(戦わない)"

    player_hand = gets.to_i
    ai_hand = rand(3)

    if !(player_hand == 3)
      hands = ["グー", "チョキ", "パー"]
      puts "ホイ！"
      puts "----------------"
      puts "あなた：#{hands[player_hand]}を出しました"
      puts  "相手：#{hands[ai_hand]}を出しました"
    end

    if player_hand == ai_hand
      puts "----------------"
      puts "あいこで..."
      janken
    elsif (player_hand == 0 && ai_hand == 1) || (player_hand == 1 && ai_hand == 2) || (player_hand == 2 && ai_hand == 0)
      puts "あなたの勝ちです"
      puts "----------------"
      @janken_result = "win"
    elsif player_hand == 3
      puts "また遊んでね"
      puts "----------------"
      puts "じゃんけん..."
      janken
    else
      puts "あなたの負けです"
      @janken_result = "lose"
    end
  end

  def hoi
    case @janken_result
    when "win"
      puts "あっち向いて〜"
      puts "0.(上) 1.(下) 2.(左) 3.(右)"
      player_direction = gets.to_i
      ai_direction = rand(4)
      direction = ["上", "下", "左", "右"]
      puts "ホイ！"
      puts "----------------"
      if player_direction == ai_direction
        puts "あなた：#{direction[player_direction]}"
        puts "相手：#{direction[ai_direction]}"
        puts "----------------"
        puts "【あなたの勝ちです】"
        puts "----------------" 
      else
        puts "あなた：#{direction[player_direction]}"
        puts "相手：#{direction[ai_direction]}"
        puts "----------------"
        puts "【引き分けです】"
        puts "----------------" 
        puts "じゃんけん..."
        janken
        hoi
      end
    when "lose"
      puts "----------------"
      puts "相手：あっち向いて〜"
      puts "あなた：0.(上) 1.(下) 2.(左) 3.(右)"
      player_direction = gets.to_i
      ai_direction = rand(4)
      direction = ["上", "下", "左", "右"]
      puts "ホイ！"
      puts "----------------"
      if player_direction == ai_direction
        puts "あなた：#{direction[player_direction]}"
        puts "相手：#{direction[ai_direction]}"
        puts "----------------"
        puts "【あなたの負けです】"
        puts "----------------" 
      else
        puts "あなた：#{direction[player_direction]}"
        puts "相手：#{direction[ai_direction]}"
        puts "【引き分けです】"
        puts "----------------" 
        puts "じゃんけん..."
        janken
        hoi
      end
    end
  end
end

jankengame = Jankengame.new
jankengame.janken
jankengame.hoi