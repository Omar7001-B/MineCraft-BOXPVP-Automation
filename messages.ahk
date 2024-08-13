global FunUser := ""
AssignFunUser()

ShuffleArray(arr) {
    Random, rand, 1, % arr.Length()
    Loop, % arr.Length() {
        rand2 := Mod(rand + A_Index - 1, arr.Length())
        arr[A_Index], arr[rand2 + 1] := arr[rand2 + 1], arr[A_Index]
    }
    return arr
}

SendChatMessage(Messages){
    Send, t
    Sleep, 100
    Random, rand, 1, % Messages.Length()
    SendMessage := Messages[rand]
    SendInput % SendMessage
    Sleep, 500
    Send, {Enter}
    Sleep, 100
}

AnnounceEveryoneWithMessage(repeatCount := 1, price:= 350, amount:= 8, itemName := "Enchanted Golden Apples"){

    msg := "Hi friend, type t/ah to buy " amount " " itemName " For Price " price " only and very good for you{!}"

    loop, %repeatCount% {
        arrowsDown := A_Index + 3
        Send, {t}
        Sleep, 200
        Send, /tell
        Send, {Space}
        Sleep, 400
        loop, %arrowsDown% {
            Send, {Down}
        }
        Sleep, 100
        Send, {Tab}
        Sleep, 100
        Send, {Space}
        Sleep, 100
        Send, %msg%
        Send, {Enter}
    }
}

ScammersWarning() {
    global ScammersPlayers := []
    ScammersPlayers.Push("syedMasood")
    ScammersPlayers.Push("NaseemGamerz")
    ScammersPlayers.Push("krkr_on_top")
    ScammersPlayers.Push("123farouk123")
    ScammersPlayers.Push("Cycton")
    ScammersPlayers.Push("mohammadxmx20")
    ScammersPlayers.Push("jemala12pro")
    ScammersPlayers.Push("allawi_966")
    ScammersPlayers.Push("XxCsmsyForSxX")
    ScammersPlayers.Push("nurshah")
    ScammersPlayers.Push("Eyad_3")
    ScammersPlayers.Push("*Jalel_NA")
    ScammersPlayers.Push("Tosrf")
    ScammersPlayers.Push("Jamala12pro")

    ShuffledNames := ShuffleArray(ScammersPlayers)

    ShuffledNamesStr := ""
    for index, name in ScammersPlayers
    {
        if (index > 1)
            ShuffledNamesStr .= ", "
        ShuffledNamesStr .= name
    }

    global WarningMessages := []
    WarningMessages.Push("Beware of scammers on t/ah, such as " ShuffledNamesStr ". They sell fake items, rename items, and use fake shulkers. Protect yourself{!}")
    WarningMessages.Push("Caution: " ShuffledNamesStr " on t/ah may sell fake items, rename items, and use fake shulkers. Keep your trades safe{!}")
    WarningMessages.Push("Alert: Exercise caution with " ShuffledNamesStr " on t/ah. They're known for fake items, renaming, and fake shulkers. Be vigilant{!}")
    WarningMessages.Push("Notice: Avoid " ShuffledNamesStr " on t/ah. They're involved in fake items, renaming, and fake shulkers. Stay clear{!}")
    WarningMessages.Push("Attention: Protect yourself on t/ah from players like " ShuffledNamesStr ". They deal with fake items, renaming, and fake shulkers{!}")
    WarningMessages.Push("Important: Watch out for " ShuffledNamesStr " on t/ah. They're known for fake items, renaming, and fake shulkers. Stay safe{!}")

    SendChatMessage(WarningMessages)
}

SellingMessagesFunction() {
    global SellingMessages := []
    SellingMessages.Push("Selling Enhanced Golden Apples t/ah, Coweb, Potions, and more for power.")
    SellingMessages.Push("Selling Full Armor Sets, Diamond and Netherite armor, Enchantments, and more for strength{!}")
    SellingMessages.Push("Selling Netherite Axes and mighty Enchantments for battle power.")
    SellingMessages.Push("Selling Golden Blocks and more for wealth. Opportunity awaits{!}")
    SellingMessages.Push("Selling Enhanced Golden Apples t/ah, Coweb, Potions, and more for legendary strength.")
    SellingMessages.Push("Selling Full Armor Sets, Diamond and Netherite armor, Enchantments, and more for victory{!}")
    SellingMessages.Push("Selling Netherite armors and powerful Enchantments for dominance.")
    SellingMessages.Push("Selling Golden Blocks and more for a path to wealth.")
    SellingMessages.Push("Selling Enhanced Golden Apples t/ah, Coweb, Potions, and more for legends.")
    SellingMessages.Push("Selling Full Armor Sets, Diamond and Netherite armor for invincibility. Power up{!}")
    SellingMessages.Push("Selling Netherite tools and mighty Enchantments for battle supremacy.")
    SellingMessages.Push("Selling Golden Blocks and more for a treasure-filled journey.")
    SellingMessages.Push("Want to stay alive forever? Buy my Enhanced Golden Apples at t/ah{!}")
    SellingMessages.Push("Do you know why I never die? Because I'm the factory of Enhanced Golden Apples. Feel free to buy at t/ah{!}")
    ;SellingMessages.Push("I'm your friend GoldenApples. You can buy me from t/ah, and you can also buy anything from me.")
    SendChatMessage(SellingMessages)
}

;F5
GeneralPvpMessagesFunction() {
    global PvpMessages := []
    PvpMessages.Push("Now don't tell me run, ez boi")
    PvpMessages.Push("My skills is good at PVP")
    PvpMessages.Push("Now tell me who is your master?")
    PvpMessages.Push("Is this what you call fighting?{!}")
    PvpMessages.Push("It's ok sometimes{!}")
    PvpMessages.Push("It's not about killing sometimes{!}")
    PvpMessages.Push("Dude who taught you this game?")
    PvpMessages.Push("Wake up man, I can beat many players at the same time{!}{!}")
    PvpMessages.Push("Don't even try to run, I'm just too good{!}")
    PvpMessages.Push("My PvP skills are on point, you're in trouble{!}")
    PvpMessages.Push("Wake up, pal. I can handle a bunch of players at once{!}")
    PvpMessages.Push("Is that all you've got? I expected more{!}")
    PvpMessages.Push("You're like a creeper - loud but not very effective{!}")
    PvpMessages.Push("I've seen sheep with better combat skills{!}")
    PvpMessages.Push("I'm like a Minecraft ninja - you can't touch this{!}")
    PvpMessages.Push("Keep practicing, you'll get there someday!")
    PvpMessages.Push("Do you need a map to find your sword?")
    PvpMessages.Push("Is this your first time holding a sword?")
    PvpMessages.Push("That was too 'ez' for me, buddy{!}")
    PvpMessages.Push("Just another day of crushing 'noobs'{!}")
    PvpMessages.Push("LOL, did you think that would work against me?")
    PvpMessages.Push("People dread facing me because my bow game is just too strong.")
    PvpMessages.Push("I've mastered the bow, and it's my secret weapon{!}")
    PvpMessages.Push("I've got a 'Punch' that sends players flying for miles.")
    PvpMessages.Push("They hate facing me because I always send them packing with 'Knock Back'{!}")
    SendChatMessage(PvpMessages)
}

; F6
EatingGoldenApplesMessagesFunction() {
    GoldenAppleMessages := []
    GoldenAppleMessages.Push(FunUser " Apple Power{!}")
    GoldenAppleMessages.Push(FunUser " Easy Mode{!}")
    GoldenAppleMessages.Push(FunUser " Healing{!}")
    GoldenAppleMessages.Push(FunUser " U eat egaps!")
    GoldenAppleMessages.Push(FunUser " Nom nom Egaps{!}")
    GoldenAppleMessages.Push(FunUser " Fight on{!}")
    GoldenAppleMessages.Push(FunUser " Stay strong without egaps{!}")
    GoldenAppleMessages.Push(FunUser " Eat Or Die{!}")
    GoldenAppleMessages.Push(FunUser " Eat more than fight{!}")
    SendChatMessage(GoldenAppleMessages)
}

;F7
RunInFightMessagesFunction(){
    RunMessages := []

    RunMessages.Push("Run, " FunUser " EZ{!}")
    RunMessages.Push("Run Hard " FunUser " Sonic{!}")
    RunMessages.Push("Noob " FunUser " Very Very{!}")
    RunMessages.Push("Haha, " FunUser " Lol{!}")
    RunMessages.Push("Go, " FunUser "Haha")
    RunMessages.Push("Track, " FunUser " Turbo{!}")
    RunMessages.Push("Race, " FunUser " Ready{!}")
    RunMessages.Push("Sprint, " FunUser )
    RunMessages.Push(FunUser " EZZZZ or rest{!}")

    SendChatMessage(RunMessages)
}

;F8
KickDownMessagesFunction(){
    KickDownMessages := []
    KickDownMessages.Push("Noob down{!}")
    KickDownMessages.Push("Stay down{!}")
    KickDownMessages.Push("Ezpz, you're down{!}")
    KickDownMessages.Push("Ground loves you{!}")
    KickDownMessages.Push("Down for the count!")
    KickDownMessages.Push("Fell faster than potatoes{!}")
    KickDownMessages.Push("Gravity's your enemy!")

    ; Additional messages
    KickDownMessages.Push("Down and out{!}")
    KickDownMessages.Push("You hit the floor{!}")
    KickDownMessages.Push("Can't stand the heat?")
    KickDownMessages.Push("Down like a rock{!}")
    KickDownMessages.Push("Kiss the ground{!}")
    KickDownMessages.Push("Flat on your face{!}")
    KickDownMessages.Push("Embrace the floor!")
    KickDownMessages.Push("Down and done{!}")
    SendChatMessage(KickDownMessages)
}

ChangeFunUser()
{
    Send, ^a
    Sleep, 100
    Send, ^c
    ClipWait, 1
    FunUser := Clipboard
    FileDelete, FunUserName.txt
    FileAppend, % FunUser, FunUserName.txt
    Send, {Enter}
}

AssignFunUser()
{
    FileRead, FunUser, FunUserName.txt
}

PasteFunUser()
{
    FileRead, FunUser, FunUserName.txt
    SendInput, %FunUser%
}
