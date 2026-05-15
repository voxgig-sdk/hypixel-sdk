package core

type HypixelError struct {
	IsHypixelError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewHypixelError(code string, msg string, ctx *Context) *HypixelError {
	return &HypixelError{
		IsHypixelError: true,
		Sdk:              "Hypixel",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *HypixelError) Error() string {
	return e.Msg
}
