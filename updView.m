%updates board view based on model

for row = 1:boardHeight
    for col = 1:boardWidth
        switch boardModel(row, col, 1)
            case pNone
                switch boardModel(row, col, 5)
                    case anyPlayerAllowed
                        boardView{row, col} = iEmpty;
                    case redOnly
                        boardView{row, col} = iRedOnly;
                    case silverOnly
                        boardView{row, col} = iSilverOnly;
                end
            case pAnub
                switch boardModel(row, col, 2)
                    case oN
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iAnubN_G;
                            case cR
                                boardView{row, col} = iAnubN_R;
                        end
                    case oE
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iAnubE_G;
                            case cR
                                boardView{row, col} = iAnubE_R;
                        end
                    case oS
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iAnubS_G;
                            case cR
                                boardView{row, col} = iAnubS_R;
                        end
                    case oW
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iAnubW_G;
                            case cR
                                boardView{row, col} = iAnubW_R;
                        end
                end
            case pPhar
                switch boardModel(row, col, 2)
                    case oN
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPharN_G;
                            case cR
                                boardView{row, col} = iPharN_R;
                        end
                    case oE
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPharE_G;
                            case cR
                                boardView{row, col} = iPharE_R;
                        end
                    case oS
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPharS_G;
                            case cR
                                boardView{row, col} = iPharS_R;
                        end
                    case oW
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPharW_G;
                            case cR
                                boardView{row, col} = iPharW_R;
                        end
                end
            case pPyr
                switch boardModel(row, col, 2)
                    case oN
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPyrNE_G;
                            case cR
                                boardView{row, col} = iPyrNE_R;
                        end
                    case oE
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPyrSE_G;
                            case cR
                                boardView{row, col} = iPyrSE_R;
                        end
                    case oS
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPyrSW_G;
                            case cR
                                boardView{row, col} = iPyrSW_R;
                        end
                    case oW
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPyrNW_G;
                            case cR
                                boardView{row, col} = iPyrNW_R;
                        end
                end
            case pScr
                switch boardModel(row, col, 2)
                    case oN
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iScrNE_G;
                            case cR
                                boardView{row, col} = iScrNE_R;
                        end
                    case oE
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iScrSE_G;
                            case cR
                                boardView{row, col} = iScrSE_R;
                        end
                    case oS
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iScrSW_G;
                            case cR
                                boardView{row, col} = iScrSW_R;
                        end
                    case oW
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iScrNW_G;
                            case cR
                                boardView{row, col} = iScrNW_R;
                        end
                end
            case pSphx
                switch boardModel(row, col, 2)
                    case oN
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iSphxN_G;
                            case cR
                                boardView{row, col} = iSphxN_R;
                        end
                    case oE
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iSphxE_G;
                            case cR
                                boardView{row, col} = iSphxE_R;
                        end
                    case oS
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iSphxS_G;
                            case cR
                                boardView{row, col} = iSphxS_R;
                        end
                    case oW
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iSphxW_G;
                            case cR
                                boardView{row, col} = iSphxW_R;
                        end
                end
            case pPhar
                switch boardModel(row, col, 2)
                    case oN
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPharN_G;
                            case cR
                                boardView{row, col} = iPharN_R;
                        end
                    case oE
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPharE_G;
                            case cR
                                boardView{row, col} = iPharE_R;
                        end
                    case oS
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPharS_G;
                            case cR
                                boardView{row, col} = iPharS_R;
                        end
                    case oW
                        switch boardModel(row, col, 3)
                            case cS
                                boardView{row, col} = iPharW_G;
                            case cR
                                boardView{row, col} = iPharW_R;
                        end
                end
        end
    end
end