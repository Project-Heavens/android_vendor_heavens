package generator

import (
	"fmt"

	"android/soong/android"
)

func heavensExpandVariables(ctx android.ModuleContext, in string) string {
	heavensVars := ctx.Config().VendorConfig("heavensVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if heavensVars.IsSet(name) {
			return heavensVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
