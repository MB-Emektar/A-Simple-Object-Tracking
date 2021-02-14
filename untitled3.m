I_1 = im2double(imread('frame1.jpg'));
I_2 = im2double(imread('frame2.jpg'));

%in the second frame we're given a section(B_target) to track it frame
%by frame. In this case, we need to track the man on the pictures, and the
%target is given as his head. The code below finds him in (first) previous
%frame. The code simply scan all the frame and finds the most similar
%section to target.

B_target = I_2(65:96,81:112);
imshow(B_target)
title("Target in the Second Frame")
mae=inf;
for i = 1:4:256
    for j = 1:4:320
        temp = (sum(sum(abs(B_target - I_1(i:i+31,j:j+31)))))/(32*32);
        if temp<mae
           mae=temp; 
            matchedBlock = [i,j];
        end
    end
end

mae
i=matchedBlock(1,1)
j=matchedBlock(1,2)
targetI_1=I_1(i:i+31,j:j+31);
figure;
imshow(targetI_1)
title("Target in the Second Frame")