set-env _WORKDIR $E:HOME'/workspace'

var RV_DIR = /home/aimi/workspace/riscv/arch
var RV_BUILD = /var/lib/archbuild/extra-riscv64

set-env RV_BUILD $RV_BUILD
set-env RV_CACHE $RV_DIR'/cache'
set-env RV_PATCH_REPO $RV_DIR'/archriscv-packages'
#export RV_BUILD="$RV_DIR/build"

set-env RV1 $RV_BUILD'/aimi'
set-env RV2 $RV_BUILD'/aimi2'

var RV_BIN = $RV_DIR'/arch-riscv-scripts/bin'
if (has-value $paths $RV_BIN) { nop } else { set paths = (conj $paths $RV_BIN) }
