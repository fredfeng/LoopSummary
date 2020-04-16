
pragma solidity ^0.5.10;



contract C {
  

  uint256 initialPrice;
uint256 i;
uint256 price;
Pixel[] pixels;
uint256[] pixelIdxs;
uint256 remainValue;
uint256[] colors;

  function foo() public {
    
for(uint256 i = 0; i < pixelIdxs.length; i++){
uint256 pixelIdx = pixelIdxs[i];
if (pixels[pixelIdx].times == 0) {
price = ((initialPrice) * (9)) / (10);
} else if (pixels[pixelIdx].times == 1) {
price = ((initialPrice) * (11)) / (10);
} else {
price = ((pixels[pixelIdx].price) * (11)) / (10);
}


if (remainValue < price) {
transferToAccount(pixelIdx, msg.sender, 1000, remainValue);
break;
}

assert(colors[i] < 25);
remainValue = (remainValue) - (price);
pixels[pixelIdx].color = colors[i];
pixels[pixelIdx].times = (pixels[pixelIdx].times) + (1);
pixels[pixelIdx].price = price;
Drawcolor(pixelIdx, msg.sender, colors[i], price);
transferETH(pixelIdx, price);
pixels[pixelIdx].owner = msg.sender;
}


  }
}

//#LOOPVARS: i

contract Pixel { }
