## Integration Tsdfesting 🧪



Hello OpenQ Integration Tester.

Thanks for joining!

Let's get you started...

Begin by navigating to the environment under test. In this case, that is `https://staging.openq.dev`

### OpenQ Explore Homepage
---
#### ✅ First Load
- It shows a list of issues

#### ✅ Bounty Card

##### Single
- Shows budget
- 

##### Ongoing

##### Contest

### Bounty Homepage
---
#### ✅ Load Bounties
- Bounties load quickly

#### ✅ Search Issue
- Filters correctly based on search and issue title

#### ✅ Toggling Unfunded/Claimed
- Filters correctly

#### ✅ Search Issue by Tag
- Filters correctly based on search and issue labels

#### ✅ Sort By
- Sorts bounties in order of Newest/Oldest

### Organization Details
---
Repeat the steps completed for Bounty Homepage on the issues shown for the organiation

### Wallet Connect and GitHub OAuth
---
#### ✅ Wallet Connect
- Connect Wallet button prompts MetaMask and allows connect
- Switch Network shows if switch to wrong network
- Once connected, allows disconnect by clicking on Jazzicon account button

#### ✅ GitHub OAuth Flow
- GitHub Sign In correctly signs in and redirects to homepage, now showing GitHub Avatar
- GitHub Sign Out correctly signs out user (check Application Cookies that cookie was removed) and switches back to sign in button

### Mint Bounty
---
Create a new Issue on the [OpenQ-TestRepo](https://github.com/OpenQDev/OpenQ-TestRepo).

Attempt minting a bounty with all of the following **NINE** combinations:

| Wallet                         | Fund                     |
| ------------------------------ | ------------------------ |
| Disconnected                   | Invalid GitHub Issue URL |
| Connected w/ Incorrect Network | Valid GitHub Issue URL   |
| Connected w/ Correct Network   | Already Minted Bounty    |

#### ✅ Mint Bounty modal error handling
- Confirm that the proper errors are shown for each

#### ✅ Successfully Mint Bounty
- Redirects to bounty page with confetti
- Shows correct bounty data in a timely manner

### Bounty Modal/Details
---
#### ✅ Bounty Details + Modal Functionality
- Twitter button shows correct Twitter link and content
- Polygonscan link opens Polygonscan to bounty address in new tab
- GitHub link links to corresponding GitHub issue
- OpenQ link links to Bounty Details in new tab (if on modal)
- "No Deposits" is shown

### Fund Bounty
---
Attempt funding a bounty with all of the following **NINE** combinations:

| Wallet                         | Fund                   |
| ------------------------------ | ---------------------- |
| Disconnected                   | No Volume              |
| Connected w/ Incorrect Network | User's Balance Too Low |
| Connected w/ Correct Network   | Valid Balance          |

#### ✅ Fund a bounty with MATIC successfully after confirming the above.
- Show confirmation with correct information on funding amount, token and bounty address.
- Shows Transfer MATIC
- Shows Success modal
- Dismisses Success modal
- Return to BountyDetails shows the new deposit and correct TVL updated

#### ✅ Fund a bounty with ERC20 successfully after confirming the above.
- Show confirmation with correct information on funding amount, token and bounty address.
- Shows Approve modal and loader
- Shows Transfer modal after Approval txn is confirmed
- Shows Success modal
- Dismisses Success modal
- Return to BountyDetails shows the new deposit and correct TVL updated

### Refund Bounty
---
[TBD]

### Close Minted Bounty, Attempt Claim
---
#### ✅ Correctly complete the bounty you minted in the `Mint Bounty` step with a pull request on GitHub:
- Make a `README.md` update in the GitHub interface
- Make a pull request, writing the `Closes ##` referencing the issue you created in [OpenQ-TestRepo](https://github.com/OpenQDev/OpenQ-TestRepo)
- Merge it

#### ✅ Attemp claim while signed out, should be disbaled and show prompt

Attempt claim with all of the following **SIX** combinations:

| User                                                | Issue/Bounty                           |
| --------------------------------------------------- | -------------------------------------- |
| Claimant is merged referent pull request author     | No pull requests references issue      |
| Claimant is NOT merged referent pull request author | Unmerged pull request references issue |
|                                                     | Merged pull request references issue   |

You can use the following issue's with several pull request references or no references:

- No pull requests references issue: `bounty page`
- Pull Request Reference by FlacoJones, not merged: 
- Pull Request Reference by FlacoJones, merged:
- Pull Request Reference by Claimant, merged: The pull request you minted in prior step

#### ✅ Confirm claim works
- Shows correct error message for each
- Claim shows success message
- Claimers balance increased by amount in bounty
- Bounty Details now show "Total Value Claimed" and grey border around deposits

### Miscellaneous
---
#### ✅ Check Console
- No errors printed during any of the above activites

## Make Pull Request with All Discovered Bugs

Create a PR in the respective repo with the title:

`Integration Test - GITHUB_NAME - DATE`

List all issues found, and link to the sub-issue you created to address these issues