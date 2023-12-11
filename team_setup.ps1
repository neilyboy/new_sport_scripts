Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Team Selection"
$form.Size = New-Object System.Drawing.Size(405, 490)
$form.StartPosition = "CenterScreen"

# Form Icon
$iconBase64      = 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAA4AAAAOABol/+ygAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAALYSURBVFiF7dddiFVVFAfw33LGD4QazZKxDMUkjerFhoIMpSQoDe1JmDejfPEh8M2HHuohKKinSnyaECkV9SHQwgqjD30Ywq8i/JiKBrEchSnC1AR3D2ffON4599y5Yonggsvd+6z/Xv//3muvdTiRUnIjbcINZb8l4KYXEBHTIuK2/11ARPRHxDH8iOGI+D4iVl6TgpRSRz+8iqN4NM8DSzGE9R3HqyBYjO0YxPtYUPI9iNOYWbFuPs5hTunZAmzGEezE4uZ1V6UgIlZjB05iA/7GgYjoy5BnsSWlNFJxkkPYg6dzrD58g7+wHiewK3OMTQG6cBbPVBz5/jzehJdq0vMK3sjj/djQ5H8+c0wYkwI8hF8QTYvuwSV0Yw3erBGwOZN04wLuavJ34VfcXyXgznxcM5oWPYXhkpgRzKogX4hR9OT5KTzehOnFxQZmzCXE53gbk/L8DnyKt0qYfhzHsrzTyViVT++5Eu4d7Ma0PJ+Cd/FZyyrIpzCC37AN5xXVMLGE6cFXSNl/IY/3YGoJNwmH8Se25rhnm9PybxVExCJ8hDP5/6iidGZiICLmRsTLOIhjeAGPoA9r87ojEfFiRMzGQBa7C9/lmCPYHRGPNXgbap/AMNZU5HZKTktSlNXcmkv4QN71FbzeSGXJH1nsaSzJz/Tko1lWE3gHPkRX285W3Im92FSDWa5oWj3wGjbWgFdlxdPbkTeV7iiW1mAGMrfBNrvfh/7xkpfWrcP2Gv8KDAb+wLe4bKyForXOSCmNVvhbWkTchx/wRQvIZCzqxupMVGUPY36n5Nl+UjSdjxXvgSpL3Smlva0iRMRERdPp2FJKKSKGcCil9HUdsC6PC/G7UoPp4A70Kt6ms2txbYIEvsR76O2A/F58gE/aYaPRDGrScLeiZJ7Ez+PMwDxFa16bUjpXG7+dgJKQ2zFL6wvbsIRTKaXz44o7XgH/ld3c3wW3BFwP+we1p4r+CYbpKQAAAABJRU5ErkJggg=='
$iconBytes       = [Convert]::FromBase64String($iconBase64)
# initialize a Memory stream holding the bytes
$stream          = [System.IO.MemoryStream]::new($iconBytes, 0, $iconBytes.Length)
$form.Icon       = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::new($stream).GetHIcon()))

# Specify the folder name
$textFolderName = "text"
$logoFolderName = "logo"

# Check if the folder exists, if not, create it
$textFolderPath = Join-Path -Path $PSScriptRoot -ChildPath $textFolderName
if (-not (Test-Path $textFolderPath -PathType Container)) {
    New-Item -Path $textFolderPath -ItemType Directory
}

# Check if the folder exists, if not, create it
$logoFolderPath = Join-Path -Path $PSScriptRoot -ChildPath $logoFolderName
if (-not (Test-Path $logoFolderPath -PathType Container)) {
    New-Item -Path $logoFolderPath -ItemType Directory
}


# Create labels
$labelHome = New-Object System.Windows.Forms.Label
$labelHome.Location = New-Object System.Drawing.Point(10, 10)
$labelHome.Size = New-Object System.Drawing.Size(150, 20)
$labelHome.Text = "Select Home Team"

$labelAway = New-Object System.Windows.Forms.Label
$labelAway.Location = New-Object System.Drawing.Point(230, 10)
$labelAway.Size = New-Object System.Drawing.Size(150, 20)
$labelAway.Text = "Select Away Team"

$labelVs = New-Object System.Windows.Forms.Label
$labelVs.Location = New-Object System.Drawing.Point(185, 330)
$labelVs.Size = New-Object System.Drawing.Size(30, 20)
$labelVs.Font = New-Object System.Drawing.Font("Consolas", 10, [System.Drawing.FontStyle]::Bold)
$labelVs.Text = "VS."

$labelHomeColor = New-Object System.Windows.Forms.Label
$labelHomeColor.Location = New-Object System.Drawing.Point(40, 420)
$labelHomeColor.Size = New-Object System.Drawing.Size(99, 20)
$labelHomeColor.Text = "Select Home Color"

$labelAwayColor = New-Object System.Windows.Forms.Label
$labelAwayColor.Location = New-Object System.Drawing.Point(253, 420)
$labelAwayColor.Size = New-Object System.Drawing.Size(97, 20)
$labelAwayColor.Text = "Select Away Color"

# Create list boxes
$listBoxHome = New-Object System.Windows.Forms.ListBox
$listBoxHome.Location = New-Object System.Drawing.Point(10, 30)
$listBoxHome.Size = New-Object System.Drawing.Size(150, 200)
$listBoxHome.Name = "listBoxHome"

$listBoxAway = New-Object System.Windows.Forms.ListBox
$listBoxAway.Location = New-Object System.Drawing.Point(230, 30)
$listBoxAway.Size = New-Object System.Drawing.Size(150, 200)
$listBoxAway.Name = "listBoxAway"

# Create picture boxes for previews
$previewHome = New-Object System.Windows.Forms.PictureBox
$previewHome.Location = New-Object System.Drawing.Point(10, 250)
$previewHome.Size = New-Object System.Drawing.Size(150, 150)
$previewHome.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$previewHome.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D

$previewAway = New-Object System.Windows.Forms.PictureBox
$previewAway.Location = New-Object System.Drawing.Point(230, 250)
$previewAway.Size = New-Object System.Drawing.Size(150, 150)
$previewAway.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$previewAway.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D

# Create OK button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(145, 410)
$okButton.Size = New-Object System.Drawing.Size(100, 30)
$okButton.Text = "OK"

# Event handler for list box selection change
$listBoxHome.Add_SelectedIndexChanged({
    $selectedHome = $listBoxHome.SelectedItem
    if ($selectedHome -ne $null -and $selectedHome -notin @("away.png", "home.png")) {
        $previewHome.Image = [System.Drawing.Image]::FromFile((Get-Item $selectedHome).FullName)
    }
})

$listBoxAway.Add_SelectedIndexChanged({
    $selectedAway = $listBoxAway.SelectedItem
    if ($selectedAway -ne $null -and $selectedAway -notin @("away.png", "home.png")) {
        $previewAway.Image = [System.Drawing.Image]::FromFile((Get-Item $selectedAway).FullName)
    }
})

# Event handler for OK button click
$okButton.Add_Click({
    $selectedHome = $listBoxHome.SelectedItem
    $selectedAway = $listBoxAway.SelectedItem

    if ($selectedHome -ne $null -and $selectedHome -notin @("away.png", "home.png") -and
        $selectedAway -ne $null -and $selectedAway -notin @("away.png", "home.png")) {

        # Use -replace to remove file extension first and then split the string
        $homeCity, $homeMascot = ($selectedHome -replace '\.png$' -split '-', 2).TrimEnd('.png')
        $awayCity, $awayMascot = ($selectedAway -replace '\.png$' -split '-', 2).TrimEnd('.png')
        
        $homeCity = $selectedHome -replace '\.png$', ''
        $homeMascot = ($homeCity -split '-', 2)[1]
        $homeCity = ($homeCity -split '-', 2)[0]

        $awayCity = $selectedAway -replace '\.png$', ''
        $awayMascot = ($awayCity -split '-', 2)[1]
        $awayCity = ($awayCity -split '-', 2)[0]


        # Set-Content with the full path to the text files
        Set-Content -Path (Join-Path -Path $textFolderPath -ChildPath "home_team_city.txt") -Value $homeCity -Force
        Set-Content -Path (Join-Path -Path $textFolderPath -ChildPath "home_team_mascot.txt") -Value $homeMascot -Force

        Set-Content -Path (Join-Path -Path $textFolderPath -ChildPath "away_team_city.txt") -Value $awayCity -Force
        Set-Content -Path (Join-Path -Path $textFolderPath -ChildPath "away_team_mascot.txt") -Value $awayMascot -Force

        # Copy-Item with the full path to the image files
        Copy-Item -Path $selectedHome -Destination (Join-Path -Path $logoFolderPath -ChildPath "home.png") -Force
        Copy-Item -Path $selectedAway -Destination (Join-Path -Path $logoFolderPath -ChildPath "away.png") -Force

                $form.Close()
                } else {
                    [System.Windows.Forms.MessageBox]::Show("Please select an image for both Home and Away.", "Selection Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
                }
            })


# Create ColorDialog
$colorDialog = New-Object System.Windows.Forms.ColorDialog

# Create PictureBox controls for color selection
$colorPictureBoxHome = New-Object System.Windows.Forms.PictureBox
$colorPictureBoxHome.Location = New-Object System.Drawing.Point(10, 410)
$colorPictureBoxHome.Size = New-Object System.Drawing.Size(30, 30)
$colorPictureBoxHome.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D

$colorPictureBoxAway = New-Object System.Windows.Forms.PictureBox
$colorPictureBoxAway.Location = New-Object System.Drawing.Point(350, 410)
$colorPictureBoxAway.Size = New-Object System.Drawing.Size(30, 30)
$colorPictureBoxAway.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D

# Event handler for color selection
$colorPictureBoxHome.Add_Click({
    $result = $colorDialog.ShowDialog()
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        $color = $colorDialog.Color
        $colorPictureBoxHome.BackColor = $color
        Save-ColorImage -Color $color -Path (Join-Path -Path $logoFolderPath -ChildPath "home_color.png")
    }
})

$colorPictureBoxAway.Add_Click({
    $result = $colorDialog.ShowDialog()
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        $color = $colorDialog.Color
        $colorPictureBoxAway.BackColor = $color
        Save-ColorImage -Color $color -Path (Join-Path -Path $logoFolderPath -ChildPath "away_color.png")
    }
})

# Helper function to save color as a 10x10 px PNG image
function Save-ColorImage {
    param (
        [System.Drawing.Color]$Color,
        [string]$Path
    )

    $bitmap = New-Object System.Drawing.Bitmap 10, 10
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $brush = New-Object System.Drawing.SolidBrush $Color
    $graphics.FillRectangle($brush, 0, 0, 10, 10)
    $bitmap.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
    $graphics.Dispose()
    $bitmap.Dispose()
}

# Populate list boxes with image names from the current directory
Get-ChildItem -Filter *.png | ForEach-Object {
    $imageName = $_.Name
    if ($imageName -notin @("away.png", "home.png")) {
        $listBoxHome.Items.Add($imageName)
        $listBoxAway.Items.Add($imageName)
    }
}

# Add controls to the form
$form.Controls.Add($labelHome)
$form.Controls.Add($labelAway)
$form.Controls.Add($labelVs)
$form.Controls.Add($labelHomeColor)
$form.Controls.Add($labelAwayColor)
$form.Controls.Add($listBoxHome)
$form.Controls.Add($listBoxAway)
$form.Controls.Add($previewHome)
$form.Controls.Add($previewAway)
$form.Controls.Add($okButton)
$form.Controls.Add($colorPictureBoxHome)
$form.Controls.Add($colorPictureBoxAway)

# Display the form
$form.ShowDialog()
