OpenAuction(){
    WaitForGoodPing()
    Send, t
    Sleep, 300
    Send /ah
    Sleep, 200
    Send, { Enter }
}

isElementSold(ItemImg){
    WaitForGoodPing()
    OpenAuction()
    Sleep, 500
    MoveMouseClick([851, 546]) ; Your Items in auction
    Sleep, 500
    Send, {F11}
    Sleep, 800
    isHere := MouseMoveToImg(ItemImg, 789, 374, 1138, 585, 50)
    Sleep, 100
    Send, {Esc}
    Sleep, 400
    Send, {F11}
    Sleep, 800
    if(isHere) {
        return false ; Not Sold yet
    }
    else {
        return true ; Sold
    }
}

SellNineStacksEgap(){
    loop, 999999 {
        SellItemFromBox("apples2.bmp", "BlackBox.bmp", 50, 350, 20, 32)
        Sleep, 400
        Random, SleepDuration, 10000, 20000
        Sleep, %SleepDuration%
    }
}

SellAndAnnounceCurrenteItemInHand(price:= 350, amount:= 8, itemName := "Enchanted Golden Apples", announceMessage := true){
    WaitForGoodPing()
    Send, {t}
    Sleep, 200
    Send, /ah sell %price% %amount%
    Sleep, 200
    Send, {Enter}
    Sleep, 200
    SellingItemMessages := []
    SellingItemMessages.push("Selling " amount " " itemName " for " price "$ on t/ah.")
    SellingItemMessages.push("Selling " amount " " itemName " for " price "$ on t/ah")
    SellingItemMessages.push("Selling " amount " " itemName " for " price "$ on t/ah")
    SellingItemMessages.push(" " amount " " itemName " at " price "$ on t/ah now!{!}")
    SellingItemMessages.push(" Find " amount " " itemName " at " price "$ on t/ah.")
    SellingItemMessages.push(" " amount " " itemName " for " price "$ on t/ah")
    SellingItemMessages.push(" " amount " " itemName " at " price "$ on t/ah")

    if(announceMessage) {
        SendChatMessage(SellingItemMessages)
    }
}

SellItemFromBox(ItemImg, BoxImg, minPrice, maxPrice, minAmount, maxAmount, checkSold := true, chatMessage := true) {
    if(checkSold){
        isSold := isElementSold(ItemImg)

        if(!isSold)
            return
    }

    isElementExisting := PutStackInSlot1(ItemImg, BoxImg)

    if(!isElementExisting)
        return

    Sleep, 200

    Random, randomPrice, minPrice, maxPrice
    Random, randomAmount, minAmount, maxAmount
    SellAndAnnounceCurrenteItemInHand(randomPrice, randomAmount, "Egaps", chatMessage)
    return
}

CheckMoneyOfAllPlayers(repeatCount := 1){
    times := repeatCount * 20
    loop, %times% {
        arrowsDown := A_Index - 1
        Send, {t}
        Sleep, 200
        Send, /bal
        Send, {Space}
        Sleep, 500
        loop, %arrowsDown% {
            Send, {Down}
        }
        Sleep, 100
        Send, {Tab}
        Sleep, 100
        Send, {Enter}
    }
}