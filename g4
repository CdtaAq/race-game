private void timer1_Tick(object sender, EventArgs e)
        {
            Score++; // increase the score as we move
            distance.Text = "" + Score; // show the score on the distance label
            roadTrack1.Top += roadSpeed; // move the track 1 down with the += 
            roadTrack2.Top += roadSpeed; // move the track 2 down with the += 
            // if the track has gone past -630 then we set it back to default
            // this means it will give us a seamless animation
            if (roadTrack1.Top > 630)
            {
                roadTrack1.Top = -630;
            }
            if (roadTrack2.Top > 630)
            {
                roadTrack2.Top = -630;
            }
            // end of track animation.
            if (carLeft) { player.Left -= carSpeed; } // move the car left if the car left is true
            if (carRight) { player.Left += carSpeed; } // move the car right if the car right is true
            // end of car moving
            //bounce the car off the boundaries of the panel
            if (player.Left < 1)
            {
                carLeft = false; // stop the car from going off screen
            }
            else if (player.Left + player.Width > 380)
            {
                carRight = false;
            }
            // end of the boundaries checks
            //move the AI cars down
            AI1.Top += trafficSpeed; 
            AI2.Top += trafficSpeed;
            //respawn the AIs and change the their images
            if (AI1.Top > panel1.Height)
            {
                changeAI1(); // change the AI car images once they left the scene
                AI1.Left = rnd.Next(2, 160); // random numbers where they appear on the left
                AI1.Top = rnd.Next(100, 200) * -1; // random numbers where they appear on top
            }
            if (AI2.Top > panel1.Height)
            {
                changeAI2(); // change the AI car images once they left the scene
                AI2.Left = rnd.Next(185, 327); // random numbers where they appear on the left
                AI2.Top = rnd.Next(100, 200) * -1; // random numbers where they appear on top
            }
            // end of respawning the AIs and image changing
            // hit test the player and AI
            //below if statement is checking multiple conditions
            // if player hits AI1 OR player hits AI2
            if (player.Bounds.IntersectsWith(AI1.Bounds) || player.Bounds.IntersectsWith(AI2.Bounds))
            {
                gameOver(); // this will run when the player hits an AI object
            }
            // end of hit testing the player. 
            // speed up the traffic
            // below we are checking for multiple conditions
            // if score is above 100 AND below 500
            if (Score > 100 && Score < 500)
            {
                trafficSpeed = 6;
                roadSpeed = 7;
            }
            // if score is above 500 AND below 1000
            else if (Score > 500 && Score < 1000)
            {
                trafficSpeed = 7;
                roadSpeed = 8;
            }
            // if score is above 1200
            else if (Score > 1200)
            {
                trafficSpeed = 9;
                roadSpeed = 10;
            }
            // end of the traffic speeding up
        }

        