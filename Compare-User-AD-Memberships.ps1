#--------------------------------------#
#        Information Gathering         #
#--------------------------------------#

# Read usernames
$User1 = Read-Host "Enter first username to compare" 
$User2 = Read-Host "Enter second username to compare" 

#--------------------------------------#
#              Functional              #
#--------------------------------------#

# Get AD group memberships of users
$Member1 = Get-ADPrincipalGroupMembership -Identity $User1
$Member2 = Get-ADPrincipalGroupMembership -Identity $User2
 
# Output Message 
Write-Host 
"$User1 and $User2 have the following difference in AD group membership. 
The SideIndicator indicates which AD user was found in the corresponding AD group.  
$User1 is a member of SideIndicator <= and $User2 is a member of SideIndicator =>
Groups that both users are a part of are not displayed.
"
 
# Compare User1 membership to User2 membership and display only the difference in membership.
# Only show the name of the group and sort alphabetically. 
# The SideIndicator indicates which AD user was found in the corresponding AD group. 
Compare-Object -ReferenceObject ($Member1) -DifferenceObject ($Member2) -Property Name | Sort Name