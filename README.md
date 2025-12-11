# MiniVote-dApp
A beginner Solidity smart contract for a single-question voting dApp.

## Features

- One question set at deployment.
- Each address can vote only once.
- Public function to read current results.
- Simple donation function to demonstrate `payable`.
- Events for both voting and donations.

## Contract Overview

- `question` (string): the voting question.
- `yesCount` / `noCount` (uint): vote counters.
- `hasVoted` (mapping): prevents double voting.
- `totalDonations` (uint): sum of ETH sent via `donate()`.

## Main Functions

- `constructor(string _question)` – sets the question.
- `vote(bool voteYes)` – external function to vote.
- `donate()` – external payable function to send ETH.
- `getResults()` – public view function returning yes and no counts.
