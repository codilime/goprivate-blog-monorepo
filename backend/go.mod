module example.org/backend

go 1.18

replace (
	example.org/log => github.com/codilime/goprivate-blog-log v0.0.0-20230206091151-9fb711046a54
	example.org/server => github.com/codilime/goprivate-blog-server v0.0.0-20230206091232-c11a2be1dce2
)

require (
	example.org/log v0.0.0-00010101000000-000000000000
	example.org/server v0.0.0-00010101000000-000000000000
)

require (
	github.com/mattn/go-colorable v0.1.12 // indirect
	github.com/mattn/go-isatty v0.0.14 // indirect
	github.com/rs/zerolog v1.27.0 // indirect
	golang.org/x/sys v0.0.0-20210927094055-39ccf1dd6fa6 // indirect
)
