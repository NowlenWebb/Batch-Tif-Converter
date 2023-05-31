#Path to Ghostscript EXE
$tool = '<Path to GhostScript EXE>'

#Directory containing PDFs to be converted
$inputDir = '<Input Directory>'

#Directory where TIFs will be saved
$outputDir = '<Output Directory>'

$pdfs = get-childitem $inputDir | where {$_.Extension -match "pdf"}

foreach($pdf in $pdfs){
    $tif = $outputDir + $pdf.BaseName + ".tif"
    if(test-path $tif){
        "tif file already exists " + $tif
    }
    else{   
        "Processing " + $pdf.Name        
        $param = "-sOutputFile=$tif"
        & $tool -q -dNOPAUSE -sDEVICE=tiffg4 $param -r300 $pdf.FullName -c quit
    }
}

EXIT
#Adapted by JoshuaNowlenWebb - github.com/NowlenWebb
#From code by RISL2023 - StackOverflow
