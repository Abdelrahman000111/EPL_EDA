CREATE DATABASE PL_PLAYERS;

USE PL_PLAYERS;

SELECT * FROM [Premier-Players];

-- What Is The Biggest 10 Players In Age??
SELECT TOP 10 Player , Team , Age FROM [Premier-Players]
ORDER BY Age DESC;


-- What Is The Smallest 10 Players In Age??
SELECT TOP 10 Player , Team , Age FROM [Premier-Players]
ORDER BY Age;


-- Which Team Has The Biggest Number Of Players Above 30??
SELECT TOP 10 Team , COUNT(*) AS countOfPlayersAbove30 FROM [Premier-Players]
WHERE Age > 30
GROUP BY Team
ORDER BY countOfPlayersAbove30 DESC;


-- Which Team Has The Biggest Number Of Players Between 20 And 30??
SELECT TOP 10 Team , COUNT(*) AS countOfPlayersBetween20_30
FROM [Premier-Players]
WHERE Age BETWEEN 20 AND 30
GROUP BY Team
ORDER BY countOfPlayersBetween20_30 DESC;


-- Which Team Has The Biggest Number Of Players Less 20??
SELECT TOP 10 Team , COUNT(*) AS countOfPlayersLess20
FROM [Premier-Players]
WHERE Age < 20
GROUP BY Team
ORDER BY countOfPlayersLess20 DESC;


-- Number Of Goals And Assists For Players Above 30??
SELECT SUM(Gls) AS sumOfGoals , SUM(Ast) AS sumOfAssists 
FROM [Premier-Players]
WHERE Age > 30;


-- Number Of Goals And Assists For Players Between 20 And 30??
SELECT SUM(Gls) AS sumOfGoals , SUM(Ast) AS sumOfAssists 
FROM [Premier-Players]
WHERE Age BETWEEN 20 AND 30;


-- Number Of Goals And Assists For Players Less 20??
SELECT SUM(Gls) AS sumOfGoals , SUM(Ast) AS sumOfAssists 
FROM [Premier-Players]
WHERE Age < 20;


-- Distribution Of Countries??
SELECT DISTINCT Nation FROM [Premier-Players];


-- Top 10 Nations Have Goals In PL??
SELECT TOP 10 Nation , SUM(Gls) AS sumOfGoals FROM [Premier-Players]
GROUP BY Nation
ORDER BY sumOfGoals DESC;


-- Top 10 Nations Have Assists In PL??
SELECT TOP 10 Nation , SUM(Ast) AS sumOfAssists FROM [Premier-Players]
GROUP BY Nation
ORDER BY sumOfAssists DESC;


-- Top 10 Nations Have Goals And Assists In PL??
SELECT TOP 10 Nation , SUM(Gls) + SUM(Ast) AS totalContributions FROM [Premier-Players]
GROUP BY Nation
ORDER BY totalContributions DESC;


-- Top 10 Countries Have Players In PL(Exlude England Players)??
SELECT TOP 10 Nation , COUNT(*) AS totalPlayers FROM [Premier-Players]
WHERE Nation != 'eng ENG'
GROUP BY Nation
ORDER BY totalPlayers DESC;


-- Top 10 Countries Have Players Have Less 20 Years??
SELECT TOP 10 Nation , COUNT(*) AS totalPlayers FROM [Premier-Players]
WHERE Age < 20
GROUP BY Nation
ORDER BY totalPlayers DESC;


-- Top 10 Teams Have Foreign Players In PL??
SELECT TOP 10 Team , COUNT(*) AS totalPlayers FROM [Premier-Players]
WHERE Nation != 'eng ENG'
GROUP BY Team
ORDER BY totalPlayers DESC;


-- Top 10 Scorers??
SELECT TOP 10 Player , SUM(Gls) AS totalGoals FROM [Premier-Players]
GROUP BY Player
ORDER BY totalGoals DESC;


-- Top 10 Teams Scores Goals??
SELECT TOP 10 Team , SUM(Gls) AS totalGoals FROM [Premier-Players]
GROUP BY Team
ORDER BY totalGoals DESC;


-- Top 10 MF Scorers??
SELECT TOP 10 Player , SUM(Gls) AS totalGoals FROM [Premier-Players]
WHERE Pos = 'MF'
GROUP BY Player
ORDER BY totalGoals DESC;


-- Top 10 DF Scorers??
SELECT TOP 10 Player , SUM(Gls) AS totalGoals FROM [Premier-Players]
WHERE Pos = 'DF'
GROUP BY Player
ORDER BY totalGoals DESC;


-- Top 10 Teams Them Foreign Players Have Goals In PL??
SELECT TOP 10 Team , SUM(Gls) AS totalGoals FROM [Premier-Players]
WHERE Nation != 'eng ENG'
GROUP BY Team
ORDER BY totalGoals DESC;


-- Top 10 Teams Scores Without Penalties In PL??
SELECT TOP 10 Team , SUM(G_PK) AS totalGoals FROM [Premier-Players]
GROUP BY Team
ORDER BY totalGoals DESC;


-- Top 10 Teams Scores From Penalties In PL??
SELECT TOP 10 Team , SUM(PK) AS totalGoals FROM [Premier-Players]
GROUP BY Team
ORDER BY totalGoals DESC;


-- Top 10 Players Scores Without Penalties In PL??
SELECT TOP 10 Player , SUM(G_PK) AS totalGoals FROM [Premier-Players]
GROUP BY Player
ORDER BY totalGoals DESC;


-- Top 10 Players Scores From Penalties In PL??
SELECT TOP 10 Player , SUM(PK) AS totalGoals FROM [Premier-Players]
GROUP BY Player
ORDER BY totalGoals DESC;


-- Top 10 Teams Have XG??
SELECT Team , SUM(xG) AS expectedGoals FROM [Premier-Players]
GROUP BY Team
ORDER BY expectedGoals DESC;


-- Top 10 Teams Waste Goals??
SELECT TOP 10 Team , SUM(Gls) AS totalGoals , SUM(xG) AS expectedGoals , SUM((xG - Gls)) AS Goals_Expected FROM [Premier-Players]
GROUP BY Team
ORDER BY Goals_Expected DESC;

-- Top 10 Teams Exploited The Chances??
SELECT TOP 10 Team , SUM(Gls) AS totalGoals , SUM(xG) AS expectedGoals , SUM((xG - Gls)) AS Goals_Expected FROM [Premier-Players]
GROUP BY Team
ORDER BY Goals_Expected;


-- Top 10 Players Carries Ball Forward??
SELECT TOP 10 Player , SUM(PrgC) AS carryBallForward FROM [Premier-Players]
GROUP BY Player
ORDER BY carryBallForward DESC;


-- Top 10 MF Players Carries Ball Forward??
SELECT TOP 10 Player , SUM(PrgC) AS carryBallForward FROM [Premier-Players]
WHERE Pos = 'MF'
GROUP BY Player
ORDER BY carryBallForward DESC;


-- Top 10 DF Players Carries Ball Forward??
SELECT TOP 10 Player , SUM(PrgC) AS carryBallForward FROM [Premier-Players]
WHERE Pos = 'DF'
GROUP BY Player
ORDER BY carryBallForward DESC;


-- Top 10 FW MF Jocker Players Carries Ball Forward??
SELECT TOP 10 Player , SUM(PrgC) AS carryBallForward FROM [Premier-Players]
WHERE Pos = 'FW,MF' OR Pos = 'MF,FW'
GROUP BY Player
ORDER BY carryBallForward DESC;


-- Top 10 Players Pass Ball Forward??
SELECT TOP 10 Player , SUM(PrgP) AS progPasses FROM [Premier-Players]
GROUP BY Player
ORDER BY progPasses DESC;


-- Top 10 MF Players Pass Ball Forward??
SELECT TOP 10 Player , SUM(PrgP) AS progPasses FROM [Premier-Players]
WHERE Pos = 'MF'
GROUP BY Player
ORDER BY progPasses DESC;


-- Top 10 DF Players Pass Ball Forward??
SELECT TOP 10 Player , SUM(PrgP) AS progPasses FROM [Premier-Players]
WHERE Pos = 'DF'
GROUP BY Player
ORDER BY progPasses DESC;


-- Latest 10 MF Players Played Above 5 Matches Pass Ball Forward??
SELECT TOP 10 Player , SUM(PrgP) AS progPasses FROM [Premier-Players]
WHERE Pos = 'MF' AND MP > 5
GROUP BY Player
ORDER BY progPasses;


-- Latest 10 DF Players Played Above 5 Matches Pass Ball Forward??
SELECT TOP 10 Player , SUM(PrgP) AS progPasses FROM [Premier-Players]
WHERE Pos = 'DF' AND MP > 5
GROUP BY Player
ORDER BY progPasses;

SELECT * FROM [Premier-Players];