import Cocoa
/*:
 # Counting Votes
 You've been hired to write the software to count the votes for a local election. Write a function `countVotes` that receives an array of (unique) names, each one representing a vote for that person. Your function should return the name of the winner of the election. In the case of a tie, the person whose name comes last alphabetically wins the election (a dumb rule to be sure, but the votes don't need to know).
 
 Example:
 ```js
 const votes = ['veronica', 'mary', 'alex', 'james', 'mary', 'michael', 'alex', 'michael'];
 
 countVotes(votes);  // should return 'michael'
 ```
 
 Analyze the time and space complexity of your solution.
 */
// Space and time complexity: O(n)
func count(_ votes: [String]) -> String {
    var dict: [String: Int] = [:]
    for vote in votes {
        if (dict[vote] != nil) {
            dict[vote]? += 1
        } else {
            dict[vote] = 1
        }
    }
    var highest = 0
    var winner = ""
    for (name, count) in dict {
        if count > highest {
            highest = count
            winner = name
        }
        if count == highest {
            winner = name > winner ? name : winner
        }
    }
    return winner
}

print(
    count([
        "veronica",
        "mary",
        "alex",
        "james",
        "mary",
        "michael",
        "alex",
        "michael",
        ])
) // should print "michael"

print(
    count([
        "john", // 1
        "johnny", // 1
        "jackie", // 1
        "johnny", // 2
        "john", // 2
        "jackie", // 2
        "jamie", // 1
        "jamie", // 2
        "john", // 3
        "johnny", // 3
        "jamie", // 3
        "johnny", // 4
        "john", // 4
        ])
) // should print "johnny"
